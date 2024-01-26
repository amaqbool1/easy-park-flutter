import 'package:isar/isar.dart';

part 'login.g.dart';

@collection
class Login {
  Id id = Isar.autoIncrement;
  String? email;
  String? password;
  bool? rememberMe;
}
