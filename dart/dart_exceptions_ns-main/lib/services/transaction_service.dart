import 'dart:math';

import 'package:dart_exceptions/api_key.dart';
import 'package:dart_exceptions/exceptions/transactions_exceptions.dart';
import 'package:dart_exceptions/helpers/helper_taxes.dart';
import 'package:dart_exceptions/models/account.dart';
import 'package:dart_exceptions/models/transaction.dart';
import 'package:dart_exceptions/services/account_service.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class TransactionService {
  final AccountService _accountService = AccountService();
  String url = "https://api.github.com/gists/e5e823a3967fa76f813a936c4165ccab";
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  Future<List<Transaction>> getAll() async {
    Response response = await get(Uri.parse(url));

    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic =
        json.decode(mapResponse["files"]["transaction.json"]["content"]);

    List<Transaction> listTransactions = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapTrans = dyn as Map<String, dynamic>;
      Transaction transaction = Transaction.fromMap(mapTrans);
      listTransactions.add(transaction);
    }

    return listTransactions;
  }

  addTransaction(Transaction transaction) async {
    List<Transaction> listTransaction = await getAll();
    listTransaction.add(transaction);
    save(listTransaction);
  }

  save(List<Transaction> listTransaction) async {
    List<Map<String, dynamic>> listContent = [];
    for (Transaction transaction in listTransaction) {
      listContent.add(transaction.toMap());
    }

    String content = json.encode(listContent);

    Response response = await post(Uri.parse(url),
        headers: {"Authorization": "Bearer $githubApiKey"},
        body: json.encode({
          "description": "transaction.json",
          "public": true,
          "files": {
            "transaction.json": {"content": content},
          },
        }));
  }

  Future<void> makeTransaction({
    required String idSender,
    required String idReceiver,
    required double amount,
  }) async {
    List<Account> listAccounts = await _accountService.getAll();

    if (listAccounts.where((acc) => acc.id == idSender).isEmpty) {
      throw SenderNotExistsException(
        cause: idSender,
      );
    }

    Account senderAccount = listAccounts.firstWhere(
      (acc) => acc.id == idSender,
    );

    if (listAccounts.where((acc) => acc.id == idReceiver).isEmpty) {
      throw ReceiverNotExistsException(
        cause: idReceiver,
      );
    }

    Account receiverAccount = listAccounts.firstWhere(
      (acc) => acc.id == idReceiver,
    );

    double taxes = calculateTaxesByAccount(senderAccount, amount);

    if (senderAccount.balance < amount + taxes) {
      throw InsufficientFundsException(
        cause: senderAccount,
        amount: amount,
        taxes: taxes,
      );
    }

    senderAccount.balance -= (amount + taxes);
    receiverAccount.balance += amount;

    listAccounts[listAccounts.indexWhere(
      (acc) => acc.id == senderAccount.id,
    )] = senderAccount;

    listAccounts[listAccounts.indexWhere(
      (acc) => acc.id == receiverAccount.id,
    )] = receiverAccount;

    Transaction transaction = Transaction(
      id: (Random().nextInt(89999) + 10000).toString(),
      senderAccountId: senderAccount.id,
      receiverAccountId: receiverAccount.id,
      date: DateTime.now(),
      amount: amount,
      taxes: taxes,
    );

    await _accountService.save(listAccounts);
    await addTransaction(transaction);
  }
}
