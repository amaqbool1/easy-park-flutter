import 'package:isar/isar.dart';

part 'sign_up.g.dart';

@collection
class SignUp {
  Id id = Isar.autoIncrement;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
}
