import 'package:isar/isar.dart';

part 'parking_spot.g.dart';

@collection
class ParkingSpot {
  Id id = Isar.autoIncrement;
  late bool isSelected;
  late bool alreadyBooked;
  late String parkingSpotNumber;
}
