// import 'models/user.dart';
import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  User registerUserByEmail(String fullName, String email) {
    for (var val in users.values) {
      if (val.email == email)
        throw Exception("A user with this email already exists");
    }
    var user = User(name: fullName, email: email);
    users.addAll({fullName: user});
    return user;
  }

  User registerUserByPhone(String fullName, String phone) {
    for (var val in users.values) {
      if (val.phone == phone)
        throw Exception("A user with this phone already exists");
    }
    var user = User(name: fullName, phone: phone);
    users.addAll({fullName: user});
    return user;
  }

  bool addFriendToUser(String userFirstName, User friend) {
    if (users.containsKey(userFirstName)) {
      users[userFirstName].addFriend(friend);
      return true;
    }
    return false;
  }

  User findUserInFriends(String userFirstName, String usersFriend) {
    if (users.containsKey(userFirstName)) {
      for (var friend in users[userFirstName].getFriends) {
        if (friend.firstName == usersFriend) {
          return friend;
        }
      }
    }
    return null;
  }

  bool importUsers(List<User> newUsers) {
    if (newUsers.length == 0) return false;
    newUsers.forEach((element) {
      if (!users.containsKey(element.firstName))
        users[element.firstName] = element;
    });
    return true;
  }
}
