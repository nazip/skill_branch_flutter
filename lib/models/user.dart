

class User {
  String email;
  String phone;
  String _firstName;
  String _lastName;
  
  User._({String firstName, String lastName , String  email, this.phone}) {
    _firstName = firstName;
    _lastName = lastName;
  }

  factory User(name, email) {
    return User._(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      email: email
    ); 
  }

  static String _getFirstName(fullName) => fullName.split(" ")[0];
  static String _getLastName(fullName) => fullName.split(" ")[1];


  @override
  String toString() {
    return '''
      fistName: $_firstName
      lastName: $_lastName
      email: $email
      phone: $phone
    ''';
  }

  @override
  bool operator ==(Object obj) {
    if (obj == null) return false;
    if (obj is User) {
      return (_firstName == obj._firstName) && 
             (_lastName == obj._lastName) && 
             (phone == obj.phone) && 
             (email == obj.email); 
    }
    return false;
  }
}