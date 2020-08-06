import '../string_utils.dart';

class User with UserUtils {
  String email;
  String phone;
  String _firstName;
  String _lastName;
  List<User> friends;

  User._({String firstName, String lastName, String email, String phone}) {
    _firstName = capitalize(firstName);
    _lastName = capitalize(lastName);
    this.email = email;
    this.phone = phone;
    this.friends = [];
  }

  factory User({String name = '', String phone = '', String email = ''}) {
    if (name.isEmpty) throw Exception('name should not empty');
    if (phone.isEmpty && email.isEmpty)
      throw Exception('phone or phone should not empty');
    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        email: email,
        phone: phone);
  }

  addFriend(User user) => friends.add(user);

  List<User> get getFriends => friends;
  User addFriends(User u, List<User> friend) {
    u.friends.addAll(friend);
    return u;
  }

  static String _getFirstName(fullName) => fullName.split(" ")[0];
  static String _getLastName(fullName) => fullName.split(" ")[1];

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get name => '$_firstName $_lastName';

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

  @override
  int get hashCode => this.hashCode;
}
