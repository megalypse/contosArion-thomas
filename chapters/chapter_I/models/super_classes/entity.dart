import 'dart:math' as math;

import '../base_classes/character.dart';

class Entity {
  String nome;
  int _hp;
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

  int get hp {
    _hp = ((10 + modCon));
    return _hp;
  }

  int get ac {
    _ac = 10 + modDex;
    return _ac;
  }

  Entity({
    this.nome,
    this.con,
    this.str,
    this.dex,
    this.car,
    this.wis,
    this.itl,
  });

  bool isPlayer() {
    print(this.runtimeType);
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

    if (d20 >= ac) {
      takeDamage(damage: 3 + dmgBonus);
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
    _hp -= damage;

    if (_hp <= (0 - hp / 2)) {
      if (isPlayer()) {
        print('Você morreu');
      } else {
        print('$nome morreu...');
      }
    } else if (_hp <= 0) {
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
