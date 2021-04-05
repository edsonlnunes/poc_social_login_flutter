// nome
// documento
// dados de endereço
// email
import 'package:login_firebase/features/home/domain/value_objects/document.dart';
import 'package:login_firebase/features/home/domain/value_objects/email.dart';
import 'package:login_firebase/features/home/domain/value_objects/id.dart';
import 'package:login_firebase/features/home/domain/value_objects/name.dart';

class Customer {
  ID _id;
  ID get id => _id;

  Name _name;
  Name get name => _name;

  Document _document;
  Document get document => _document;

  Email _email;
  Email get email => _email;

  Customer({
    required String id,
    required String firstName,
    required String lastName,
    required String document,
    required String email,
  })   : this._id = ID(id: id),
        this._name = Name(firstName: firstName, lastName: lastName),
        this._document = Document(doc: document),
        this._email = Email(address: email);
}
