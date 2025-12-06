import 'package:dart_exceptions/models/account.dart';

double calculateTaxesByAccount(Account account, double amount) {
  Map<String, double> accountTypeTaxes = {
    'Ambrosia': 0.005,
    'Canjica': 0.033,
    'Pudim': 0.025,
    'Brigadeiro': 0.0001
  };

  // if (amount < 5000 || !accountTypeTaxes.containsKey(account.accountType)) return 0.0;

  if (amount > 5000) {
    try {
      return amount * accountTypeTaxes[account.accountType]!;
    } on Exception catch(e){
      print("Erro ao calcular taxas!");
      print(e);
    }
  }

  return 0.0;
}
