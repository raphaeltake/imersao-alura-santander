import 'package:anybank/conta.dart';

void main() {
  Conta contaMatheus = Conta("Matheus", 1000);
  Conta contaRoberta = Conta("Roberta", 2000);
  ContaCorrente contaChris = ContaCorrente("Chris", 4000);
  ContaPoupanca contaDenise = ContaPoupanca("Denis", 3000);

  List<Conta> contas = <Conta>[contaMatheus, contaRoberta];
  // print(contas[0].titular);

  contas[0].imprimeSaldo();
  contas[0].receber(500);
  contas[0].enviar(300);
  contaChris.receber(200);
  contaDenise.receber(100);
  contaDenise.calculaRendimento();
  contaDenise.imprimeSaldo();
}



// class Conta{
//   String _titular;
//   double _saldo;

//   Conta(this._titular, this._saldo);

//   void receber(double valor){
//     if (_saldo > valor || _saldo == valor){
//       _saldo += valor;
//     }
    
//   }

//   void enviar(double valor){ 
//     _saldo -= valor;
//   }
// }