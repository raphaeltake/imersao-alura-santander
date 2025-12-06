import 'dart:async';

import 'package:dart_exceptions/api_key.dart';
import 'package:dart_exceptions/models/account.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  String url = "https://api.github.com/gists/8e8668fbf14472b191a6488f0700772f";

  Future<List<Account>> getAll() async {
    try {
      Response response = await get(Uri.parse(url));
      _streamController.add("${DateTime.now()} | Requisição de leitura.");

      Map<String, dynamic> mapResponse = json.decode(response.body);
      List<dynamic> listDynamic = json.decode(
        mapResponse["files"]["accounts.json"]["content"],
      );

      List<Account> listAccounts = [];

      for (dynamic dyn in listDynamic) {
        Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
        Account account = Account.fromMap(mapAccount);
        listAccounts.add(account);
      }

      return listAccounts;
    } on Exception {
      print("Captura erro account_service");
      return [];
    }
  }

  addAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);
    save(listAccounts);
  }

  save(List<Account> listAccounts) async {
    List<Map<String, dynamic>> listContent = [];
    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }

    String content = json.encode(listContent);

    Response response = await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
      body: json.encode({
        "description": "account.json",
        "public": true,
        "files": {
          "accounts.json": {"content": content},
        },
      }),
    );
  }
}
