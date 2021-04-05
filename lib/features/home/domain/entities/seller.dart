// nome
// documento
// conta pra receber

import 'package:login_firebase/features/home/domain/value_objects/document.dart';
import 'package:login_firebase/features/home/domain/value_objects/id.dart';
import 'package:login_firebase/features/home/domain/value_objects/name.dart';

import '../value_objects/bank_account.dart';

class Seller {
  ID _id;
  ID get id => _id;

  Name _name;
  Name get name => _name;

  Document _document;
  Document get document => _document;

  BankAccount _account;
  BankAccount get account => _account;

  Seller({
    required String id,
    required String firstName,
    required String lastName,
    required String document,
    required int account,
    required int agency,
    required String digit,
    required int bank,
    required String typeAccount,
  })   : this._id = ID(id: id),
        this._name = Name(firstName: firstName, lastName: lastName),
        this._document = Document(doc: document),
        this._account = BankAccount(
          account: account,
          agency: agency,
          digit: digit,
          bank: bank,
          typeAccount: typeAccount,
        );
}
