import 'package:flutter/material.dart';

import '../../../../../common_widgets/common_widgets.dart';
import '../../../../../constants/constants.dart';
import '../../../../../extensions/hex_color.dart';
import '../../../../../utils/utils.dart';
import '../../../pick_parking_spot/pick_parking_spot.dart';
import 'dart:math' as math;


class CancelledBookingListWidget extends StatefulWidget {
  const CancelledBookingListWidget({super.key});

  @override
  State<CancelledBookingListWidget> createState() =>
      _CancelledBookingListWidgetState();
}

class _CancelledBookingListWidgetState
    extends State<CancelledBookingListWidget> {
  final isarService = IsarService();

  List<Parking> cancelledParkingList = [];

  bool showLoading = true;

  getParkingSpots() async {
    List<Parking> parkingList = await isarService.getBookedParkingList();

    if (parkingList.isNotEmpty) {
      for (int i = 0; i < parkingList.length; i++) {
        if (parkingList[i].parkingSpotStatus == ParkingSpotStatus.CANCELLED) {
          cancelledParkingList.add(parkingList[i]);
        }
      }
    }
    showLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getParkingSpots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showLoading
        ? const SizedBox.shrink()
        : ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: index == 0 ? 20 : 0,
                ),
                child: Container(
                  // height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: HexColor("#FFFFFF"),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor('#04060F').withOpacity(0.05),
                        blurRadius: 60,
                        offset: const Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: HexColor("#F75555").withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Transform.rotate(
                                angle: math.pi / 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/golden_car.png",
                                  ),
                                ),
                              ),
                            ),
                            gapW16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  EPTextWidget(
                                    text: cancelledParkingList[index]
                                            .parkingName ??
                                        "",
                                    textSize: 20,
                                    textColor: HexColor("#212121"),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  gapH10,
                                  EPTextWidget(
                                    text: cancelledParkingList[index]
                                            .parkingAddress ??
                                        "",
                                    textSize: 14,
                                    textColor: HexColor("#616161"),
                                    fontWeight: FontWeight.normal,
                                  ),
                                  gapH10,
                                  Row(
                                    children: [
                                      EPTextWidget(
                                        text:
                                            "\$${cancelledParkingList[index].totalAmount ?? ""}",
                                        textSize: 16,
                                        textColor: HexColor("#4448AE"),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      gapW4,
                                      EPTextWidget(
                                        text:
                                            "/ ${cancelledParkingList[index].totalHours ?? "0"} hour",
                                        textSize: 10,
                                        textColor: HexColor("#616161"),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      gapW8,
                                      Container(
                                        height: 24,
                                        width: 73,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: HexColor("#F75555"),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Center(
                                          child: EPTextWidget(
                                            text: "Cancelled",
                                            textSize: 10,
                                            textColor: HexColor("#F75555"),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return gapH20;
            },
            itemCount: cancelledParkingList.length,
          );
  }
}
