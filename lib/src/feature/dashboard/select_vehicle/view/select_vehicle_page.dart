import 'package:flutter/material.dart';

import '../select_vehicle.dart';

class SelectVehiclePage extends StatelessWidget {
  final String parkingName, parkingAddress;

  const SelectVehiclePage({
    super.key,
    required this.parkingName,
    required this.parkingAddress,
  });

  @override
  Widget build(BuildContext context) {
    return SelectVehicleView(
      parkingName: parkingName,
      parkingAddress: parkingAddress,
    );
  }
}
