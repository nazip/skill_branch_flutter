import 'package:FlutterGalleryApp/user_holder.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/models/user.dart';

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

  test(
      'register UserByEmail',
      () =>
          {expect(1, users.registerUserByEmail('Имя Фамилия', 'abc@mail.ru'))});
  test(
      'register UserByPhone',
      () => {
            expect(1, users.registerUserByPhone('Имя Фамилия', '+7917 3333333'))
          });

  users.registerUserByEmail('Имя Фамилия', 'abc@mail.ru');
  var user = User(name: 'Имя фамилия', email: 'abc@mail.ru');
  test('addFriendToUser',
      () => {expect(true, users.addFriendToUser('Имя', user))});
}
