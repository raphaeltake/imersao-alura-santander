import 'package:dart_exceptions/models/account.dart';

class SenderNotExistsException implements Exception {
  String message;
  String cause;

  SenderNotExistsException({
    this.message = "Remetente não existe!",
    required this.cause,
  });
}

class ReceiverNotExistsException implements Exception {
  String message;
  String cause;

  ReceiverNotExistsException({
    this.message = "Remetente não existe!",
    required this.cause,
  });
}

class InsufficientFundsException implements Exception {
  String message;
  Account cause;
  double amount;
  double taxes;

  InsufficientFundsException({
    this.message = "Fundos insuficientes para a transação!",
    required this.cause,
    required this.amount,
    required this.taxes,
  });
}
