abstract class Pontuacao{
  void calculaPontos();
  void devolveColocaco();
}

class Volei extends Esporte implements Pontuacao{
  Volei(super.time);

  @override
  void calculaPontos() {
    // TODO: implement calculaPontos
  }

  @override
  void devolveColocaco() {
    // TODO: implement devolveColocaco
  }

}

abstract class Esporte{
  String time;
  Esporte(this.time);
}