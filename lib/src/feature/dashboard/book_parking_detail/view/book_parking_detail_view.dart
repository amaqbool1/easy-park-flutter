import 'package:easy_park/src/feature/dashboard/pick_parking_spot/pick_parking_spot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../constants/constants.dart';
import '../../../../extensions/extensions.dart';
import '../../../../utils/utils.dart';

class BookParkingDetailView extends StatefulWidget {
  final String parkingName, parkingAddress, vehicleName, vehicleNumber;

  const BookParkingDetailView({
    super.key,
    required this.parkingName,
    required this.parkingAddress,
    required this.vehicleName,
    required this.vehicleNumber,
  });

  @override
  State<BookParkingDetailView> createState() => _BookParkingDetailViewState();
}

class _BookParkingDetailViewState extends State<BookParkingDetailView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  double _currentSliderValue = 0;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  double toDouble(TimeOfDay myTime) => myTime.hour + 0.0;

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
          text: "Book Parking Details",
          textSize: 24,
          textColor: HexColor("#212121"),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH16,
            EPTextWidget(
              text: "Select Date",
              textSize: 18,
              textColor: HexColor("#212121"),
              fontWeight: FontWeight.bold,
            ),
            gapH16,
            Container(
              // height: MediaQuery.sizeOf(context).height * 0.36,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: HexColor("#F1F2FF"),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  rowHeight: 36,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  lastDay: DateTime.utc(2030, 3, 14),
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      formatButtonShowsNext: false,
                      titleCentered: true,
                      headerPadding: EdgeInsets.symmetric(vertical: 4)),
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  sixWeekMonthsEnforced: false,
                  calendarStyle: const CalendarStyle(
                    outsideDaysVisible: false,
                  ),
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
              ),
            ),
            gapH16,
            EPTextWidget(
              text: "Duration",
              textSize: 18,
              textColor: HexColor("#212121"),
              fontWeight: FontWeight.bold,
            ),
            gapH12,
            Slider(
              value: _currentSliderValue,
              max: 24,
              label: _currentSliderValue.round().toString(),
              divisions: 24,
              onChanged: (value) {},
            ),
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EPTextWidget(
                  text: "Start Hour",
                  textSize: 18,
                  textColor: HexColor("#212121"),
                  fontWeight: FontWeight.bold,
                ),
                EPTextWidget(
                  text: "End Hour",
                  textSize: 18,
                  textColor: HexColor("#212121"),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            gapH12,
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: selectedStartTime ?? TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial,
                        builder: (BuildContext context, Widget? child) {
                          // We just wrap these environmental changes around the
                          // child in this builder so that we can apply the
                          // options selected above. In regular usage, this is
                          // rarely necessary, because the default values are
                          // usually used as-is.
                          return Theme(
                            data: Theme.of(context).copyWith(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                            ),
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                alwaysUse24HourFormat: false,
                              ),
                              child: child!,
                            ),
                          );
                        },
                      );

                      setState(() {
                        selectedStartTime = time;
                        if (kDebugMode) {
                          print(
                              "Selected Time >>>> ${selectedStartTime!.format(context)}");
                        }
                      });

                      if (selectedStartTime != null &&
                          selectedEndTime != null) {
                        if (toDouble(selectedStartTime!) >
                            toDouble(selectedEndTime!)) {
                          if (context.mounted) {
                            SnackBars.showWarningSnackBar(
                              context: context,
                              errorMessage: "Please select valid time!",
                            );
                            return;
                          }
                        } else {
                          int value =
                              selectedEndTime!.hour - selectedStartTime!.hour;

                          _currentSliderValue = value.toDouble();
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      height: 58,
                      decoration: BoxDecoration(
                        color: HexColor("#FAFAFA"),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          EPTextWidget(
                            text: selectedStartTime.toString() == "null"
                                ? ""
                                : selectedStartTime!.hour.toString(),
                            textSize: 14,
                            textColor: HexColor("#212121"),
                            fontWeight: FontWeight.w600,
                          ),
                          Icon(
                            CupertinoIcons.clock_fill,
                            color: HexColor("#212121"),
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                gapW12,
                SvgPicture.asset("assets/svg/arrow_right.svg"),
                gapW12,
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: selectedEndTime ?? TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial,
                        builder: (BuildContext context, Widget? child) {
                          // We just wrap these environmental changes around the
                          // child in this builder so that we can apply the
                          // options selected above. In regular usage, this is
                          // rarely necessary, because the default values are
                          // usually used as-is.
                          return Theme(
                            data: Theme.of(context).copyWith(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                            ),
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                alwaysUse24HourFormat: false,
                              ),
                              child: child!,
                            ),
                          );
                        },
                      );

                      setState(() {
                        selectedEndTime = time;
                      });

                      if (selectedStartTime != null &&
                          selectedEndTime != null) {
                        if (toDouble(selectedStartTime!) >
                            toDouble(selectedEndTime!)) {
                          if (context.mounted) {
                            SnackBars.showWarningSnackBar(
                              context: context,
                              errorMessage: "Please select valid time!",
                            );
                            return;
                          }
                        } else {
                          int value =
                              selectedEndTime!.hour - selectedStartTime!.hour;

                          _currentSliderValue = value.toDouble();
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      height: 58,
                      decoration: BoxDecoration(
                        color: HexColor("#FAFAFA"),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          EPTextWidget(
                            text: selectedEndTime.toString() == "null"
                                ? ""
                                : selectedEndTime!.hour.toString(),
                            textSize: 14,
                            textColor: HexColor("#212121"),
                            fontWeight: FontWeight.w600,
                          ),
                          Icon(
                            CupertinoIcons.clock_fill,
                            color: HexColor("#212121"),
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            gapH16,
            EPTextWidget(
              text: "Total",
              textSize: 18,
              textColor: HexColor("#212121"),
              fontWeight: FontWeight.bold,
            ),
            gapH16,
            Row(
              children: [
                EPTextWidget(
                  text: "\$ ${_currentSliderValue * 2}",
                  textSize: 24,
                  textColor: HexColor("#4448AE"),
                  fontWeight: FontWeight.bold,
                ),
                gapW4,
                EPTextWidget(
                  text: "/ ${_currentSliderValue.toStringAsFixed(0)} hours",
                  textSize: 14,
                  textColor: HexColor("#616161"),
                  fontWeight: FontWeight.normal,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: EPGradiantButtonWidget(
          text: "Continue",
          width: double.infinity,
          onTap: () {
            if (selectedStartTime == null) {
              SnackBars.showWarningSnackBar(
                context: context,
                errorMessage: "Please select start time!",
              );
              return;
            }

            if (selectedEndTime == null) {
              SnackBars.showWarningSnackBar(
                context: context,
                errorMessage: "Please select end time!",
              );
              return;
            }

            if (toDouble(selectedStartTime!) > toDouble(selectedEndTime!)) {
              SnackBars.showWarningSnackBar(
                context: context,
                errorMessage: "Please select valid time!",
              );
              return;
            }

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PickParkingSpotPage(
                  parkingName: widget.parkingName,
                  parkingAddress: widget.parkingAddress,
                  vehicleName: widget.vehicleName,
                  vehicleNumber: widget.vehicleNumber,
                  parkingDate:
                      _selectedDay == null ? DateTime.now() : _selectedDay!,
                  startHour: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, selectedStartTime!.hour),
                  endHour: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, selectedEndTime!.hour),
                  totalHours: int.parse(_currentSliderValue.toStringAsFixed(0)),
                  totalAmount: _currentSliderValue * 2,
                ),
              ),
            );
          },
          height: 58,
        ),
      ),
    );
  }
}
