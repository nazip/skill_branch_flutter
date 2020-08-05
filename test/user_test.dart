import 'package:flutter_test/flutter_test.dart';
import '../lib/models/user.dart';

void main() {
  User t1 = User('Имя Фамилия', 'abc@mail.ru');
  User t2 = User('Имя Фамилия', 'abc@mail.ru');
  print("Пользователи одинаковы: ${t1==t2}");
  print(t1); 

  test('create user', () =>{
    expect('user created', User('abc@mail.ru', '+791733333').toString())
  });
}
