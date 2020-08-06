// import 'models/user.dart';
import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  int registerUserByEmail(String name, String email) {
    var user = User(name: name, email: email);
    users.addAll({user.firstName: user});
    return users.length;
  }

  int registerUserByPhone(String name, String phone) {
    var user = User(name: name, phone: phone);
    users.addAll({user.firstName: user});
    return users.length;
  }

  bool addFriendToUser(String userFirstName, User friend) {
    if (users.containsKey(userFirstName)) {
      users[userFirstName] = users[userFirstName].addFriend(friend);
      return true;
    }
    return false;
  }

  User findUserInFriends(String userFirstName, String usersFriend) {
    if (users.containsKey(userFirstName)) {
      users[userFirstName].getFriends.forEach((element) {
        if (element.firstName == usersFriend) return element;
      });
    }
    return null;
  }

  importUsers(List<User> newUsers) {
    if (newUsers.length == 0) return;
    newUsers.forEach((element) {
      if (!users.containsKey(element.firstName))
        users[element.firstName] = element;
    });
  }
}
