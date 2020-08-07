// import 'models/user.dart';
import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  bool registerUserByEmail(String password, String email) {
    var user = User(password: password, email: email);
    users.addAll({user.firstName: user});
    return true;
  }

  bool registerUserByPhone(String phone) {
    var user = User(phone: phone);
    users.addAll({phone: user});
    return true;
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
