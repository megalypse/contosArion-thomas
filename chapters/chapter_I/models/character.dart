void main() {
  Char bruno = Char(
    nome: "Megalypse",
    con: 20,
    str: 20,
    dex: 20,
    car: 20,
    wis: 20,
    itl: 20,
  );

  print(bruno.toString());
}

class Char {
  String nome;
  double _hp;
  double _ac;
  double con;
  double _modCon;
  double str;
  double _modStr;
  double dex;
  double _modDex;
  double itl;
  double _modItl;
  double car;
  double _modCar;
  double wis;
  double _modWis;

  int get modCon {
    _modCon = (con - 10) / 2;
    return _modCon.floor();
  }

  int get modStr {
    _modStr = (str - 10) / 2;
    return _modStr.floor();
  }

  int get modDex {
    _modDex = (dex - 10) / 2;
    return _modDex.floor();
  }

  int get modCar {
    _modCar = (car - 10) / 2;
    return _modCar.floor();
  }

  int get modWis {
    _modWis = (wis - 10) / 2;
    return _modWis.floor();
  }

  int get modItl {
    _modItl = (itl - 10) / 2;
    return _modItl.floor();
  }

  double get hp {
    _hp = double.parse((10 + modCon).toString());
    return _hp;
  }

  double get ac {
    _ac = double.parse((10 + modDex).toString());
    return _ac;
  }

  Char({
    this.nome,
    this.con,
    this.str,
    this.dex,
    this.car,
    this.itl,
    this.wis,
  });

  @override
  String toString() =>
      "$nome \nHP: $hp \nAC: $ac \nCON: $con ($modCon) \nSTR: $str ($modStr) \nDEX: $dex ($modDex) \nCAR: $car ($modCar) \nINT: $int ($modItl) \nWIS: $wis ($modWis)";
}
