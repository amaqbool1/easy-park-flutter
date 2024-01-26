import 'package:isar/isar.dart';

part 'vehicle.g.dart';

@collection
class Vehicle {
  Id id = Isar.autoIncrement;
  String? vehicleName;
  String? vehicleNumber;
}
