import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../../../utils/utils.dart';

part 'parking.g.dart';

@collection
class Parking {
  Id id = Isar.autoIncrement;
  int? parkingSpotID;
  String? parkingName;
  String? parkingAddress;
  String? vehicleName;
  String? vehicleNumber;
  DateTime? parkingDate;
  DateTime? startHour;
  DateTime? endHour;
  double? totalAmount;
  int? totalHours;
  String? parkingSpotNumber;
  @enumerated
  ParkingSpotStatus parkingSpotStatus = ParkingSpotStatus.ACTIVE;
}
