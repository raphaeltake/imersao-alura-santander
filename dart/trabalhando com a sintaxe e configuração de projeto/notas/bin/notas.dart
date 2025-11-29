import 'dart:io';

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getComando(){
  print("Digite um comando: 1 - Adicionar nota, 2 - Listar notas, 3 - Sair");
  List<String> comandos = <String>["1", "2", "3"];
  String? entrada = "";
  entrada = stdin.readLineSync();

  if (entrada == null || !comandos.contains(entrada)){
    print("Comando inválido");
    getComando();
  }

  return entrada!;
}

List<String> adicionarNota(List<String> notas){
  print("Escreva uma nota: ");
  String? nota = "";
  nota = stdin.readLineSync();
  
  if (nota == null || nota.isEmpty){
    print("Não é possível adicionar uma nota vazia");
    adicionarNota(notas);
  }
  notas.add(nota!);
  return notas;
}

void listarNotas(List<String> notas){
  for (int i = 0; i < notas.length; i++){
    print(notas[i]);
  }
}

void menu(List<String> notas){
  print("");
  String comando = getComando();
  print("");
  
  switch (comando){
    case "1": adicionarNota(notas);
              menu(notas);
    case "2": listarNotas(notas);
              menu(notas);
    case "3": print("Até breve!");
    break;
  }
}