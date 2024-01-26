import 'package:easy_park/src/constants/app_sizes.dart';
import 'package:easy_park/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../../common_widgets/common_widgets.dart';
import '../../../../../utils/utils.dart';
import '../../../pick_parking_spot/pick_parking_spot.dart';
import 'dart:math' as math;

class OnGoingBookingListWidget extends StatefulWidget {
  const OnGoingBookingListWidget({
    super.key,
  });

  @override
  State<OnGoingBookingListWidget> createState() =>
      _OnGoingBookingListWidgetState();
}

class _OnGoingBookingListWidgetState extends State<OnGoingBookingListWidget> {
  final isarService = IsarService();

  List<Parking> onGoingParkingList = [];
  List<Parking> completedParkingList = [];
  List<Parking> cancelledParkingList = [];

  bool showLoading = true;

  getParkingSpots() async {
    List<Parking> parkingList = await isarService.getBookedParkingList();

    if (parkingList.isNotEmpty) {
      for (int i = 0; i < parkingList.length; i++) {
        if (parkingList[i].parkingSpotStatus == ParkingSpotStatus.ACTIVE) {
          if (parkingList[i].parkingDate!.day == DateTime.now().day &&
              parkingList[i].endHour!.hour < DateTime.now().hour) {
            completeParking(parkingList[i]);
          } else {
            onGoingParkingList.add(parkingList[i]);
          }
        }

        if (parkingList[i].parkingSpotStatus == ParkingSpotStatus.COMPLETED) {
          completedParkingList.add(parkingList[i]);
        }

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

  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  cancelParking(Parking parking, int index) async {
    await isarService.updateParkingSpot(ParkingSpot()
      ..parkingSpotNumber = parking.parkingSpotNumber!
      ..id = parking.parkingSpotID!
      ..isSelected = false
      ..alreadyBooked = false);

    if (context.mounted) _loadingOverlay.show(context);
    await isarService.updateParking(Parking()
      ..id = parking.id
      ..parkingSpotNumber = parking.parkingSpotNumber
      ..endHour = parking.endHour
      ..startHour = parking.startHour
      ..parkingDate = parking.parkingDate
      ..parkingAddress = parking.parkingAddress
      ..vehicleNumber = parking.vehicleNumber
      ..vehicleName = parking.vehicleName
      ..parkingSpotStatus = ParkingSpotStatus.CANCELLED
      ..parkingName = parking.parkingName
      ..totalAmount = parking.totalAmount
      ..parkingSpotID = parking.parkingSpotID
      ..totalHours = parking.totalHours);

    _loadingOverlay.hide();
    onGoingParkingList.removeAt(index);
    setState(() {});
  }

  completeParking(Parking parking) async {
    await isarService.updateParkingSpot(ParkingSpot()
      ..parkingSpotNumber = parking.parkingSpotNumber!
      ..id = parking.parkingSpotID!
      ..isSelected = false
      ..alreadyBooked = false);

    await isarService.updateParking(Parking()
      ..id = parking.id
      ..parkingSpotNumber = parking.parkingSpotNumber
      ..endHour = parking.endHour
      ..startHour = parking.startHour
      ..parkingDate = parking.parkingDate
      ..parkingAddress = parking.parkingAddress
      ..vehicleNumber = parking.vehicleNumber
      ..vehicleName = parking.vehicleName
      ..parkingSpotStatus = ParkingSpotStatus.COMPLETED
      ..parkingName = parking.parkingName
      ..totalAmount = parking.totalAmount
      ..parkingSpotID = parking.parkingSpotID
      ..totalHours = parking.totalHours);
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
                                color: HexColor("#4448AE").withOpacity(0.3),
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
                                    text:
                                        onGoingParkingList[index].parkingName ??
                                            "",
                                    textSize: 20,
                                    textColor: HexColor("#212121"),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  gapH10,
                                  EPTextWidget(
                                    text: onGoingParkingList[index]
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
                                            "\$${onGoingParkingList[index].totalAmount ?? ""}",
                                        textSize: 16,
                                        textColor: HexColor("#4448AE"),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      gapW4,
                                      EPTextWidget(
                                        text:
                                            "/ ${onGoingParkingList[index].totalHours ?? "0"} hour",
                                        textSize: 10,
                                        textColor: HexColor("#616161"),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      gapW8,
                                      Container(
                                        height: 24,
                                        width: 73,
                                        decoration: BoxDecoration(
                                          color: HexColor("#4448AE"),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Center(
                                          child: EPTextWidget(
                                            text: "Now Active",
                                            textSize: 10,
                                            textColor: HexColor("#FFFFFF"),
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
                        gapH20,
                        Divider(
                          height: 1,
                          color: HexColor("#EEEEEE"),
                          thickness: 1,
                        ),
                        gapH20,
                        EpOutlinedButton(
                          buttonText: "Cancel Booking",
                          svgPath: "",
                          height: 38,
                          mOnTap: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  surfaceTintColor: Colors.white,
                                  insetPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  title: EPTextWidget(
                                    text:
                                        'Are you sure you want to cancel your Parking Reservation?',
                                    textSize: 24,
                                    textColor: HexColor("#4448AE"),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  actions: <Widget>[
                                    gapH40,
                                    EPGradiantButtonWidget(
                                      text: "YES, Continue",
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 48,
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        cancelParking(
                                            onGoingParkingList[index], index);
                                      },
                                    ),
                                    gapH10,
                                    EPSimpleButtonWidget(
                                      text: "Cancel",
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 48,
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          width: MediaQuery.sizeOf(context).width,
                          showIconButtonOnly: false,
                          showTextOnly: true,
                          borderColor: HexColor("#4448AE"),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return gapH20;
            },
            itemCount: onGoingParkingList.length,
          );
  }
}
