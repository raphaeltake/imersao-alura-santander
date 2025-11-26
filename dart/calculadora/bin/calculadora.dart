import 'dart:io';

void main() {
  double num1 = 0;
  // num1 = double.parse(stdin.readLineSync()!);
  double num2 = 0;
  // num2 = double.parse(stdin.readLineSync()!);

  String operacao = "";
  // operacao = stdin.readLineSync()!;
  // print(num1 + num2);

  void soma(){
    print("Soma = ${num1 + num2}");
  }

  void subtracao(){
    print(num1 - num2);
  }

  void divisao(){
    print(num1 / num2);
  }

  void multiplicacao(){
    print(num1 * num2);
  }

  void calcular(){
    switch (operacao){
        case "+": soma();
        case "-": subtracao();
        case "*": multiplicacao();
        case "/": divisao();
        break;
    }
  }

  print("Digite o primeiro valor: ");
  String? entrada = stdin.readLineSync();
  if (entrada != null){
    if (entrada != ""){
      num1 = double.parse(entrada);
    }
  }

  print("Digite uma operação: ");
  entrada = stdin.readLineSync();
  if (entrada != null){
    operacao = entrada;
  }
  
  print("Digite o segundo valor: ");
  entrada = stdin.readLineSync();
  if (entrada != null){
    if (entrada != ""){
      num2 = double.parse(entrada);
    }
  }

  

  // if (operacao == "+"){
  //   soma();
  // } else if (operacao == "-"){
  //   subtracao();
  // } else if (operacao == "/"){
  //   divisao();
  // } else if (operacao == "*"){
  //   multiplicacao();
  // } else{
  //   print("Essa operação não existe!");
  // }

  print("O resultado da operação é: ");

  calcular();

}


