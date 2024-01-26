import 'package:easy_park/src/feature/dashboard/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../extensions/extensions.dart';
import '../../../../utils/utils.dart';
import '../pick_parking_spot.dart';

class PickParkingSpotView extends StatefulWidget {
  final String parkingName, parkingAddress, vehicleName, vehicleNumber;

  final DateTime parkingDate, startHour, endHour;
  final int totalHours;
  final double totalAmount;

  const PickParkingSpotView({
    super.key,
    required this.parkingName,
    required this.parkingAddress,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.parkingDate,
    required this.startHour,
    required this.endHour,
    required this.totalHours,
    required this.totalAmount,
  });

  @override
  State<PickParkingSpotView> createState() => _PickParkingSpotViewState();
}

class _PickParkingSpotViewState extends State<PickParkingSpotView> {
  final isarService = IsarService();

  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  List<ParkingSpot> parkingSpotsList = [];

  ParkingSpot? selectedParkingSpot;

  bool showLoading = true;

  getParkingSpots() async {
    parkingSpotsList = await isarService.getParkingSpotList();

    if (parkingSpotsList.isNotEmpty) {
      showLoading = false;
      setState(() {});
    } else {
      for (var i = 0; i <= 30; i++) {
        isarService.addParkingSpot(ParkingSpot()
          ..isSelected = false
          ..alreadyBooked = false
          ..parkingSpotNumber = "A0${i + 1}"
          ..id = Isar.autoIncrement);
        setState(() {});
      }
      parkingSpotsList = await isarService.getParkingSpotList();
      showLoading = false;
      setState(() {});
    }
  }

  confirmParking() async {}

  @override
  void initState() {
    getParkingSpots();
    super.initState();
  }

  bookParking() async {
    if (context.mounted) _loadingOverlay.show(context);
    await isarService.addParking(Parking()
      ..id = Isar.autoIncrement
      ..parkingSpotNumber = selectedParkingSpot!.parkingSpotNumber
      ..parkingAddress = widget.parkingAddress
      ..totalAmount = widget.totalAmount
      ..totalHours = widget.totalHours
      ..endHour = widget.endHour
      ..startHour = widget.startHour
      ..parkingDate = widget.parkingDate
      ..vehicleNumber = widget.vehicleNumber
      ..vehicleName = widget.vehicleName
      ..parkingName = widget.parkingName
      ..parkingSpotID = selectedParkingSpot!.id
      ..parkingSpotStatus = ParkingSpotStatus.ACTIVE);

    await isarService.updateParkingSpot(ParkingSpot()
      ..parkingSpotNumber = selectedParkingSpot!.parkingSpotNumber
      ..id = selectedParkingSpot!.id
      ..isSelected = selectedParkingSpot!.isSelected
      ..alreadyBooked = true);
    _loadingOverlay.hide();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(
            pageIndex: 1,
          ),
        ),
        (route) => false,
      );
    }
  }

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
          text: "Pick Parking Spot",
          textSize: 24,
          textColor: HexColor("#212121"),
          fontWeight: FontWeight.bold,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 40),
          child: Container(
            color: HexColor("#CEC9F2"),
            height: 40,
            width: double.infinity,
            child: Center(
              child: EPTextWidget(
                text: 'The parking amount will be charged on arrival !',
                textSize: 12,
                textColor: HexColor("#212121"),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: showLoading
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (context, index) {
                  return ParkingSpotWidget(
                    parkingSpot: parkingSpotsList[index],
                    onTap: parkingSpotsList[index].alreadyBooked
                        ? null
                        : () {
                            for (var i = 0; i < parkingSpotsList.length; i++) {
                              setState(() {
                                parkingSpotsList[i].isSelected = false;
                              });
                            }

                            setState(() {
                              selectedParkingSpot = parkingSpotsList[index];
                              parkingSpotsList[index].isSelected =
                                  !parkingSpotsList[index].isSelected;
                            });
                          },
                  );
                },
                itemCount: parkingSpotsList.length,
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: EPGradiantButtonWidget(
          text: "Confirm Parking",
          width: double.infinity,
          onTap: () {
            if (selectedParkingSpot == null) {
              SnackBars.showWarningSnackBar(
                context: context,
                errorMessage: "Please select any parking spot",
              );
            } else {
              bookParking();
            }
          },
          height: 58,
        ),
      ),
    );
  }
}
