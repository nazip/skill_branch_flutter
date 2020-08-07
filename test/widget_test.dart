import 'package:FlutterGalleryApp/user_holder.dart';
import 'package:flutter_test/flutter_test.dart';
// import '../lib/models/user.dart';
import 'package:FlutterGalleryApp/models/user.dart';

void main() {
  UserHolder users = UserHolder();

  test(
      'create user',
      () => {
            expect('abc@mail.ru',
                User(name: 'Имя Фамилия', email: 'abc@mail.ru').email),
            expect('Имя',
                User(name: 'имя Фамилия', phone: '+7 1111111111').firstName),
            expect('Фамилия',
                User(name: 'Имя фамилия', email: 'abc@mail.ru').lastName)
          });

  test('register UserByEmail', () {
    expect('abc@mail.ru',
        users.registerUserByEmail('Имя Фамилия', 'abc@mail.ru').email);
    // expect(true, users.registerUserByEmail('', 'abc@mail.ru') == null);
  });

  test(
      'register UserByPhone',
      () => {
            expect('+79173333333',
                users.registerUserByPhone('Имя Фамилия', '+7917 3333333').phone)
          });

  test('addFriendToUser', () {
    users.registerUserByEmail('Имя Фамилия', 'abc@mail.ru');
    var user = User(name: 'Имя фамилия', email: 'abc@mail.ru');
    expect(true, users.addFriendToUser('abc@mail.ru', user));
  });

  test('findUserInFriends', () {
    var user = User(name: 'Имя фамилия', email: 'abc@mail.ru');
    users.registerUserByEmail('Имя Фамилия', 'abc@mail1.ru');
    users.addFriendToUser('abc@mail1.ru', user);
    expect(user, users.findUserInFriends('Имя', 'Имя'));
  });

  // test('importUsers', () {
  //   List<User> newUsers = [];
  //   newUsers.add(User(name: 'Имя фамилия', email: 'abc@mail.ru'));
  //   newUsers.add(User(name: 'Имя1 фамилия1', email: 'abc1@mail.ru'));
  //   expect(true, users.importUsers(newUsers));
  //   expect(2, users.users.length);
  //   newUsers.add(User(name: 'Имя1 фамилия1', email: 'abc1@mail.ru'));
  //   expect(true, users.importUsers(newUsers));
  //   expect(2, users.users.length);
  // });
}
