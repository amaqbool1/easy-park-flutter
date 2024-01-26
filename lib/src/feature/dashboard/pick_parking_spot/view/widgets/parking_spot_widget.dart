import 'package:easy_park/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common_widgets/common_widgets.dart';
import '../../../../../extensions/extensions.dart';
import '../../pick_parking_spot.dart';

class ParkingSpotWidget extends StatelessWidget {
  final ParkingSpot parkingSpot;
  final Function()? onTap;

  const ParkingSpotWidget({
    super.key,
    required this.parkingSpot,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: parkingSpot.isSelected && parkingSpot.alreadyBooked == false
              ? HexColor("#989BF0")
              : HexColor("#F1F2FF"),
          border: parkingSpot.isSelected && parkingSpot.alreadyBooked == false
              ? Border.all(
                  width: 0,
                  color: Colors.transparent,
                )
              : parkingSpot.alreadyBooked
                  ? Border.all(
                      width: 0,
                      color: Colors.transparent,
                    )
                  : Border.all(
                      width: 2,
                      color: HexColor("#4D5DFA"),
                    ),
        ),
        child: parkingSpot.alreadyBooked
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/golden_car.png"),
              )
            : parkingSpot.isSelected
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EPTextWidget(
                        text: parkingSpot.parkingSpotNumber,
                        textSize: 18,
                        textColor: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w700,
                      ),
                      gapW8,
                      SvgPicture.asset(
                        "assets/svg/selected.svg",
                      )
                    ],
                  )
                : Center(
                    child: EPTextWidget(
                      text: parkingSpot.parkingSpotNumber,
                      textSize: 18,
                      textColor: HexColor("#4448AE"),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      ),
    );
  }
}
