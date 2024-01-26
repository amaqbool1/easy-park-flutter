import 'package:easy_park/src/constants/app_sizes.dart';
import 'package:easy_park/src/feature/dashboard/book_parking_detail/book_parking_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../extensions/extensions.dart';
import '../../../../utils/utils.dart';
import '../select_vehicle.dart';

class SelectVehicleView extends StatefulWidget {
  final String parkingName, parkingAddress;

  const SelectVehicleView({
    super.key,
    required this.parkingName,
    required this.parkingAddress,
  });

  @override
  State<SelectVehicleView> createState() => _SelectVehicleViewState();
}

class _SelectVehicleViewState extends State<SelectVehicleView> {
  TextEditingController mVehicleNameController = TextEditingController();
  TextEditingController mVehicleNumberController = TextEditingController();

  FocusNode mVehicleNameFocusNode = FocusNode();
  FocusNode mVehicleNumberFocusNode = FocusNode();

  final isarService = IsarService();

  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  final SnackBars _snackBars = SnackBars();

  List<Vehicle> vehiclesList = [];

  bool showLoading = true;

  List<bool> selectedStatusList = [];

  getAllVehicles() async {
    vehiclesList = await isarService.getAllVehicles();
    for (var i = 0; i < vehiclesList.length; i++) {
      selectedStatusList.add(false);
    }
    showLoading = false;
    setState(() {});
  }

  addVehicle() async {
    showLoading = true;
    setState(() {});

    if (vehiclesList.isNotEmpty) {
      if (context.mounted) _loadingOverlay.show(context);

      bool vehicleAlreadyExisted = false;
      for (var i = 0; i < vehiclesList.length; i++) {
        if (vehiclesList[i].vehicleNumber == mVehicleNumberController.text) {
          setState(() {
            vehicleAlreadyExisted = true;
          });
        }
      }

      if (vehicleAlreadyExisted) {
        _loadingOverlay.hide();
        if (context.mounted) {
          SnackBars.showWarningSnackBar(
            context: context,
            errorMessage: "This vehicle is already added!",
          );
        }
      } else {
        await isarService.addVehicle(Vehicle()
          ..vehicleName = mVehicleNameController.text
          ..vehicleNumber = mVehicleNumberController.text
          ..id = Isar.autoIncrement);
        vehiclesList = await isarService.getAllVehicles();
        for (var i = 0; i < vehiclesList.length; i++) {
          selectedStatusList.add(false);
        }
        setState(() {});
        _loadingOverlay.hide();
      }
    } else {
      if (context.mounted) {
        await isarService.addVehicle(Vehicle()
          ..vehicleName = mVehicleNameController.text
          ..vehicleNumber = mVehicleNumberController.text
          ..id = Isar.autoIncrement);
        _loadingOverlay.hide();

        vehiclesList = await isarService.getAllVehicles();
        for (var i = 0; i < vehiclesList.length; i++) {
          selectedStatusList.add(false);
        }
        setState(() {});
      }
    }
    showLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getAllVehicles();
    super.initState();
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
          text: "Select Your Vehicle",
          textSize: 24,
          textColor: HexColor("#212121"),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: showLoading
          ? const Center(child: CupertinoActivityIndicator())
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
                      border: Border.all(
                        color: selectedStatusList[index]
                            ? HexColor("4448AE")
                            : Colors.white,
                        width: selectedStatusList[index] ? 2 : 0,
                      ),
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
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        onTap: () {
                          for (var i = 0; i < selectedStatusList.length; i++) {
                            selectedStatusList[i] = false;
                          }
                          selectedStatusList[index] = true;
                          setState(() {});
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          height: 32,
                          width: 67.2,
                          child: Image.asset("assets/golden_car.png"),
                        ),
                        title: EPTextWidget(
                          text: vehiclesList[index].vehicleName ?? "",
                          textSize: 20,
                          textColor: HexColor("#212121"),
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: EPTextWidget(
                          text: vehiclesList[index].vehicleNumber ?? "",
                          textSize: 14,
                          textColor: HexColor("#616161"),
                          fontWeight: FontWeight.w500,
                        ),
                        trailing: Radio(
                          value: selectedStatusList[index] ? 1 : 2,
                          groupValue: 1,
                          activeColor: HexColor("4448AE"),
                          fillColor: MaterialStateProperty.all(
                            HexColor("4448AE"),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return gapH20;
              },
              itemCount: vehiclesList.length,
            ),
      bottomNavigationBar: SizedBox(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EPGradiantButtonWidget(
                text: "Add Vehicle",
                width: double.infinity,
                onTap: () {
                  mVehicleNumberController.clear();
                  mVehicleNameController.clear();
                  setState(() {});
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    EPTextWidget(
                                      text: "Add Vehicle",
                                      textSize: 24,
                                      textColor: HexColor("#212121"),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.close,
                                      ),
                                    )
                                  ],
                                ),
                                gapH16,
                                EPTextWidget(
                                  text: "Vehicle Name",
                                  textSize: 14,
                                  textColor: HexColor("#9E9E9E"),
                                  fontWeight: FontWeight.normal,
                                ),
                                gapH4,
                                EPTextFieldWidget(
                                  textEditingController: mVehicleNameController,
                                  focusNode: mVehicleNameFocusNode,
                                  textInputType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (value) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  // mPostFixIconOnTap: () {},
                                  // prefixSvg: "assets/svg/Lock.svg",
                                  // postfixSvg: "assets/svg/Hide.svg",
                                ),
                                gapH16,
                                EPTextWidget(
                                  text: "Vehicle Number",
                                  textSize: 14,
                                  textColor: HexColor("#9E9E9E"),
                                  fontWeight: FontWeight.normal,
                                ),
                                gapH4,
                                EPTextFieldWidget(
                                  textEditingController:
                                      mVehicleNumberController,
                                  focusNode: mVehicleNumberFocusNode,
                                  textInputType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (value) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  // mPostFixIconOnTap: () {},
                                  // prefixSvg: "assets/svg/Lock.svg",
                                  // postfixSvg: "assets/svg/Hide.svg",
                                ),
                                gapH24,
                                EPGradiantButtonWidget(
                                  text: 'Submit',
                                  width: MediaQuery.sizeOf(context).width,
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    if (mVehicleNameController.text.isEmpty) {
                                      SnackBars.showWarningSnackBar(
                                        context: context,
                                        errorMessage:
                                            "Vehicle name is required!",
                                      );
                                      return;
                                    }

                                    if (mVehicleNumberController.text.isEmpty) {
                                      SnackBars.showWarningSnackBar(
                                        context: context,
                                        errorMessage:
                                            "Vehicle number is required!",
                                      );
                                      return;
                                    }
                                    Navigator.pop(context);

                                    addVehicle();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                height: 58,
              ),
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EPGradiantButtonWidget(
                text: "Continue",
                width: double.infinity,
                onTap: () {
                  bool vehicleSelected = false;
                  int selectedIndex = -1;
                  for (var i = 0; i < selectedStatusList.length; i++) {
                    if (selectedStatusList[i]) {
                      vehicleSelected = true;
                      selectedIndex = i;
                      setState(() {});
                    }
                  }

                  if (vehicleSelected) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookParkingDetailPage(
                          parkingName: widget.parkingName,
                          parkingAddress: widget.parkingAddress,
                          vehicleName: vehiclesList[selectedIndex].vehicleName!,
                          vehicleNumber:
                              vehiclesList[selectedIndex].vehicleNumber!,
                        ),
                      ),
                    );
                  } else {
                    if (vehiclesList == [] || vehiclesList.isEmpty) {
                      SnackBars.showWarningSnackBar(
                        context: context,
                        errorMessage: "Please add a vehicle first!",
                      );
                      return;
                    } else {
                      SnackBars.showWarningSnackBar(
                        context: context,
                        errorMessage: "Please select a vehicle first!",
                      );
                      return;
                    }
                  }
                },
                height: 58,
              ),
            ),
            gapH16,
          ],
        ),
      ),
    );
  }
}
