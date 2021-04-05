class Name {
  String? _firstName;
  String? get firstName => _firstName;

  String? _lastName;
  String? get lastName => _lastName;

  String? get fullName => '$_firstName $_lastName';

  Name({required String firstName, required String lastName})
      : _firstName = firstName,
        _lastName = lastName;
}
