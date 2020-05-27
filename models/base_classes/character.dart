import '../super_classes/entity.dart';

class Character extends Entity {}

abstract class Heroi {
  factory Heroi._() => null;

  voar() {
    print('voou');
  }
}

class Humano extends Entity {
  Humano({
    String nome,
    int con,
    int str,
    int dex,
    int car,
    int wis,
    int itl,
  }) : super(
          nome: nome,
          con: con,
          str: str,
          dex: dex,
          car: car,
          wis: wis,
          itl: itl,
        );
}

void main() {
  Humano carlos = Humano(
    nome: 'Carlos',
    con: 20,
    str: 20,
    dex: 20,
    car: 20,
    wis: 20,
    itl: 20,
  );
  Entity goblin = Entity(
    nome: 'Goblin',
    con: 20,
    str: 20,
    dex: 10,
    car: 20,
    wis: 20,
    itl: 20,
  );

  print('Antes do atk ' + goblin.hp.toString());
  carlos.attack(goblin);
  print('Depois do atk ' + goblin.hp.toString());
}
