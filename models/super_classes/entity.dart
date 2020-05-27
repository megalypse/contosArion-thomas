import 'dart:math' as math;

import '../base_classes/character.dart';

void main() {
  Character bruno = Character();
  Entity goblin = Entity(
    nome: 'Goblin',
  );
  bruno.nome = 'Bruno';

  bruno.attack(goblin);
}

class Entity {
  String nome;
  int hp;
  int _ac;
  int con;
  int _modCon;
  int str;
  int _modStr;
  int dex;
  int _modDex;
  int itl;
  int _modItl;
  int car;
  int _modCar;
  int wis;
  int _modWis;
  math.Random _dice = math.Random();

  int get modCon {
    _modCon = ((con - 10) / 2).floor();
    return _modCon;
  }

  int get modStr {
    _modStr = ((str - 10) / 2).floor();
    return _modStr;
  }

  int get modDex {
    _modDex = ((dex - 10) / 2).floor();
    return _modDex;
  }

  int get modCar {
    _modCar = ((car - 10) / 2).floor();
    return _modCar;
  }

  int get modWis {
    _modWis = ((wis - 10) / 2).floor();
    return _modWis;
  }

  int get modItl {
    _modItl = ((itl - 10) / 2).floor();
    return _modItl;
  }

  int get ac {
    _ac = 10 + modDex;
    return _ac;
  }

  Entity({
    this.nome,
    this.con = 10,
    this.str = 10,
    this.dex = 10,
    this.car = 10,
    this.wis = 10,
    this.itl = 10,
  }) {
    hp = 10 + modCon;
  }

  bool isPlayer() {
    if (this.runtimeType == Character) return true;

    return false;
  }

  attack(
    dynamic entity, {
    int rollBonus,
    int dmgBonus,
  }) {
    rollBonus = rollBonus ?? 0;
    dmgBonus = dmgBonus ?? 0;

    int d20 = _dice.nextInt(20) + rollBonus;

    if (d20 >= entity.ac) {
      entity.takeDamage(damage: 3 + dmgBonus);
    } else {
      if (isPlayer()) {
        print('Você errou o ataque!');
      } else {
        print('$nome errou o ataque');
      }
    }
  }

  takeDamage({
    int damage,
  }) {
    hp -= damage;

    if (hp <= (0 - hp / 2)) {
      if (isPlayer()) {
        print('Você morreu');
      } else {
        print('$nome morreu...');
      }
    } else if (hp <= 0) {
      if (isPlayer()) {
        print('Você ficou inconsciente');
      } else {
        print("$nome ficou inconsciente");
      }
    } else {
      if (isPlayer()) {
        print('Você recebeu $damage de dano');
      } else {
        print('$nome recebeu $damage de dano');
      }
    }
  }

  @override
  String toString() =>
      "$nome \nHP: $hp \nAC: $ac \nCON: $con ($modCon) \nSTR: $str ($modStr) \nDEX: $dex ($modDex) \nCAR: $car ($modCar) \nINT: $itl ($modItl) \nWIS: $wis ($modWis)";
}
