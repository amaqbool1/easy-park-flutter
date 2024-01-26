import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../extensions/extensions.dart';
import '../booking.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: HexColor("#616161"),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: HexColor("#4448AE"),
            unselectedLabelStyle: GoogleFonts.urbanist(
              fontWeight: FontWeight.normal,
            ),
            labelStyle: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(
                text: "Ongoing",
              ),
              Tab(
                text: "Completed",
              ),
              Tab(
                text: "Cancelled",
              ),
            ],
          ),
          centerTitle: true,
          title: EPTextWidget(
            text: "My Bookings",
            textSize: 24,
            textColor: HexColor("#212121"),
            fontWeight: FontWeight.bold,
          ),
        ),
        body: const TabBarView(
          children: [
            OnGoingBookingListWidget(),
            CompletedBookingListWidget(),
            CancelledBookingListWidget(),
          ],
        ),
      ),
    );
  }
}
