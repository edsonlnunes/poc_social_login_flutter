class BankAccount {
  int _account;
  int get account => _account;

  int _agency;
  int get agency => _agency;

  String _digit;
  String get digit => _digit;

  int _bank;
  int get bank => _bank;

  String _typeAccount;
  String get typeAccount => _typeAccount;

  BankAccount({
    required int account,
    required int agency,
    required String digit,
    required int bank,
    required String typeAccount,
  })   : this._account = account,
        this._agency = agency,
        this._digit = digit,
        this._bank = bank,
        this._typeAccount = typeAccount;
}
