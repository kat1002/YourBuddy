import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? age;
  @HiveField(2)
  String? email;
  @HiveField(3)
  double? account;
  @HiveField(4)
  int? notifications;

  User(
      {required this.name,
      required this.age,
      required this.email,
      required this.account,
      this.notifications});

  factory User.create(
          {required String name,
          required int age,
          required String email,
          required double account}) =>
      User(name: name, age: age, email: email, account: account);
}
