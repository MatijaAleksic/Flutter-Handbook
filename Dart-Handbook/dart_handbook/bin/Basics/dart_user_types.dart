void dartUserTypesMain() {}

enum Color { red, green, blue }

class User {
  String? _name;
  int? _age;

  String get name {
    return _name!;
  }

  set name(String name) {
    _name = name;
  }

  User.named(this._name, this._age);

  User(String name, int age) {
    this._name = name;
    this._age = age;
  }

  void method() {
    print("User method: Hello my name is $_name and I have $_age years.");
  }
}

class Administrator extends User {
  int? _phoneNumber;

  Administrator.named(super.name, super.age, this._phoneNumber);

  Administrator(String name, int age, int phoneNumber) : super(name, age) {
    _phoneNumber = phoneNumber;
  }
}

class Template<T> {
  T value;
  Template(this.value);
}

extension StringExtension on String {
  String capitalize() {
    return this.substring(0, 1).toUpperCase() + this.substring(1);
  }
}
