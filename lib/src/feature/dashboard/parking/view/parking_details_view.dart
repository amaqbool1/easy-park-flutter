import 'package:easy_park/src/constants/app_sizes.dart';
import 'package:easy_park/src/extensions/extensions.dart';
import 'package:easy_park/src/feature/dashboard/select_vehicle/select_vehicle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common_widgets/common_widgets.dart';

class ParkingDetailsView extends StatelessWidget {
  const ParkingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/svg/back_arrow.svg"),
          ),
        ),
        title: EPTextWidget(
          text: "Parking Details",
          textSize: 24,
          textColor: HexColor("#212121"),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: MediaQuery.sizeOf(context).width,
            child: Image.network(
              "https://images.unsplash.com/photo-1580643060634-22188c7866c7?q=80&w=3287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
            ),
          ),
          gapH10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: EPTextWidget(
              text: "Parking Lot of San Manolia",
              textSize: 24,
              textColor: HexColor("#212121"),
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: EPTextWidget(
              text: "9569, Trantow Courts, San Manolia",
              textSize: 16,
              textColor: HexColor("#616161"),
              fontWeight: FontWeight.w500,
            ),
          ),
          gapH24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  avatar: const Icon(Icons.location_on),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      color: HexColor("#4448AE"),
                      width: 2,
                    ),
                  ),
                  label: EPTextWidget(
                    text: "2 km",
                    textSize: 16,
                    textColor: HexColor("#4448AE"),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Chip(
                  avatar: const Icon(CupertinoIcons.clock_fill),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      color: HexColor("#4448AE"),
                      width: 2,
                    ),
                  ),
                  label: EPTextWidget(
                    text: "8 AM - 10 PM",
                    textSize: 16,
                    textColor: HexColor("#4448AE"),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      color: HexColor("#4448AE"),
                      width: 2,
                    ),
                  ),
                  label: EPTextWidget(
                    text: "Valet",
                    textSize: 16,
                    textColor: HexColor("#4448AE"),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          gapH24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: EPTextWidget(
              text: "Description",
              textSize: 20,
              textColor: HexColor("#212121"),
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: EPTextWidget(
              text:
                  "The Republic of San Magnolia's five-hued flag consists of the country's crest imposed on five stripes, each a different color: blue, red, white, black, and yellow. Each color represents one of the Republic's main moral principles: freedom, equality, brotherhood, justice, and nobility.",
              textSize: 14,
              textColor: HexColor("#424242"),
              fontWeight: FontWeight.normal,
            ),
          ),
          gapH24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 75,
              width: double.infinity,
              decoration: BoxDecoration(
                color: HexColor("F1F2FF"),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EPTextWidget(
                      text: "\$2.00",
                      textSize: 24,
                      textColor: HexColor("#4448AE"),
                      fontWeight: FontWeight.bold,
                    ),
                    gapH4,
                    EPTextWidget(
                      text: "per hour",
                      textSize: 12,
                      textColor: HexColor("#757575"),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        gapH16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: EPSimpleButtonWidget(
                  text: "Cancel",
                  width: MediaQuery.sizeOf(context).width,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectVehiclePage(
                          parkingName: "Parking Lot of San Manolia",
                          parkingAddress: "9569, Trantow Courts, San Manolia",
                        ),
                      ),
                    );
                  },
                  height: 58,
                ),
              ),
              gapW12,
              Expanded(
                child: EPGradiantButtonWidget(
                  text: "Book Parking",
                  width: MediaQuery.sizeOf(context).width,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectVehiclePage(
                          parkingName: "Parking Lot of San Manolia",
                          parkingAddress: "9569, Trantow Courts, San Manolia",
                        ),
                      ),
                    );
                  },
                  height: 58,
                ),
              )
            ],
          ),
        ),
        gapH16,
      ],
    );
  }
}
