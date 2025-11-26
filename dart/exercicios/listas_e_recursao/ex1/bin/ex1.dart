/*
Criando a função de depósito e fazendo sua validação
Vamos continuar desenvolvendo o programa de banco.

Agora, concentre-se na operação de depósito e escreva uma função em que o usuário, após digitar um valor numérico, o insere na conta. Lembre-se de validar se a entrada é um número positivo. Caso contrário, solicite novamente até que um valor válido seja fornecido.
*/

import 'dart:io';

void main() {
  double saldo = 1000.00;

  double validarValores(String valor) {
    try{
      double valorDouble = double.parse(valor);
      return valorDouble;
    } catch(err){
      print("Valor incorreto!");
    }    
    return 0.0;
  }

  void deposito() {
    print("Quantia a ser depositada: ");
    double deposito = validarValores(stdin.readLineSync()!);
    if (deposito != 0){
      saldo += deposito;
      print("Deposito realizado com sucesso!");
    }
  }

  void retirada() {
    print("Quantia a ser retirada: ");
    double retirada = validarValores(stdin.readLineSync()!);
    if (retirada != 0){
      saldo -= retirada;
      print("Retirada concluída com sucesso!");
    } 
  }

  void transferencia() {
    print("Quantia a ser transferido: ");
    double transferencia = validarValores(stdin.readLineSync()!);
    if (transferencia != 0){
      saldo -= transferencia;
      print("transferência concluída com sucesso!");
    }
  }

  void pagamento() {
    print("Quantia a pago: ");
    double pagamento = validarValores(stdin.readLineSync()!);
    if (pagamento != 0){
      saldo -= pagamento;
      print("pagamento concluído com sucesso!");
    }
  }

  Map<String, Function> operacoes = {
    "deposito": deposito,
    "retirada": retirada,
    "transferencia": transferencia,
    "pagamento": pagamento,
  };

  String melhoraApresentacaoOperacoes() {
    return operacoes.entries.map((op) => "${op.key}").join(", ");
  }

  void direcionarOperacao() {
    String? operacao = stdin.readLineSync();
    if (operacao == null || !operacoes.containsKey(operacao)) {
      print("Isso não é uma operação! Tente novamente.");
      return;
    }
    operacoes[operacao]!();
  }

  void mostrarOperacoes() {
    print("\nOlá, seu saldo é: $saldo");
    print("Digite uma operação - (${melhoraApresentacaoOperacoes()}):");
    direcionarOperacao();
    mostrarOperacoes();
  }

  mostrarOperacoes();
}
