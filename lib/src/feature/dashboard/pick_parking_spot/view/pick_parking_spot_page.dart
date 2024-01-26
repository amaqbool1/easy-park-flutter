import 'package:flutter/material.dart';

import '../pick_parking_spot.dart';

class PickParkingSpotPage extends StatelessWidget {
  final String parkingName, parkingAddress, vehicleName, vehicleNumber;

  final DateTime parkingDate, startHour, endHour;
  final int totalHours;
  final double totalAmount;

  const PickParkingSpotPage({
    super.key,
    required this.parkingName,
    required this.parkingAddress,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.parkingDate,
    required this.startHour,
    required this.endHour,
    required this.totalAmount,
    required this.totalHours,
  });

  @override
  Widget build(BuildContext context) {
    return PickParkingSpotView(
      parkingName: parkingName,
      parkingAddress: parkingAddress,
      vehicleName: vehicleName,
      vehicleNumber: vehicleNumber,
      parkingDate: parkingDate,
      startHour: startHour,
      endHour: endHour,
      totalHours: totalHours,
      totalAmount: totalAmount,
    );
  }
}
