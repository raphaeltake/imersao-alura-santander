import 'package:dart_exceptions/exceptions/transactions_exceptions.dart';
import 'package:dart_exceptions/screens/account_screen.dart';
import 'package:dart_exceptions/services/transaction_service.dart';

void main() {
  TransactionService()
      .makeTransaction(idSender: "ID001", idReceiver: "ID002", amount: 500)
      .catchError(
    (e) {
      print(e.message);
      print(
          "${e.cause.name} possuí saldo ${e.cause.balance} que é menor que ${e.amount + e.taxes}");
    },
    test: (error) => error is InsufficientFundsException,
  ). then((value) {},);
}

// void main() async {
//   // AccountScreen accountScreen = AccountScreen();
//   // accountScreen.initializeStream();
//   // accountScreen.runChatBot();

//   try{
//     TransactionService().makeTransaction(idSender: "ID001", idReceiver: "ID002", amount: 500);
//   } on InsufficientFundsException catch(e){
//     print(e.message);
//     print("${e.cause.name} possuí saldo ${e.cause.balance} que é menor que ${e.amount + e.taxes}");
//   }
// }
