import 'dart:io';

void main() {
  double num1 = double.parse(stdin.readLineSync()!);
  double num2 = double.parse(stdin.readLineSync()!);
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

  soma();
  subtracao();
  divisao();
  multiplicacao();

}


