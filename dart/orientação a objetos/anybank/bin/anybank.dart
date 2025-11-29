import 'package:anybank/conta.dart';

void main() {
  ContaCorrente contaChris = ContaCorrente("Chris", 4000);
  ContaPoupanca contaDenise = ContaPoupanca("Denis", 3000);

  // print(contas[0].titular);

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