import 'package:flutter/material.dart';

import '../book_parking_detail.dart';

class BookParkingDetailPage extends StatelessWidget {
  final String parkingName, parkingAddress, vehicleName, vehicleNumber;

  const BookParkingDetailPage({
    super.key,
    required this.parkingName,
    required this.parkingAddress,
    required this.vehicleName,
    required this.vehicleNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BookParkingDetailView(
      parkingName: parkingName,
      parkingAddress: parkingAddress,
      vehicleName: vehicleName,
      vehicleNumber: vehicleNumber,
    );
  }
}
