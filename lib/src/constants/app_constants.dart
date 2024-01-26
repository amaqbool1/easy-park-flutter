import '../feature/walkthrough/walkthrough.dart';

class AppConstants {
  static List<WalkThrough> walkThroughList = [
    WalkThrough(
      firstTitle: 'Find Parking ',
      secondTitle: "Around You Easily",
      highlightedTitle: 'Places ',
      subtitle:
          'Effortlessly locate parking spots in your vicinity with our user-friendly app. Real-time updates, transparent pricing, and a seamless interface make finding parking a breeze. Say goodbye to parking stress and streamline your experience with our convenient solution.',
      image: 'assets/walkthrough_1.png',
    ),
    WalkThrough(
      firstTitle: 'Book and Pay ',
      secondTitle: "Quickly & Safely",
      highlightedTitle: 'Parking ',
      subtitle:
          'Swiftly reserve and pay for parking through our hassle-free platform. Enjoy a quick and secure process, ensuring a seamless experience for all your parking needs.',
      image: 'assets/walkthrough_2.png',
    ),
    WalkThrough(
      firstTitle: 'Extend ',
      secondTitle: "Time As You Need",
      highlightedTitle: 'Parking ',
      subtitle:
          'Enjoy flexibility with extended parking durations tailored to your needs. Our service allows you to effortlessly extend your parking time, ensuring convenience and peace of mind',
      image: 'assets/walkthrough_3.png',
    ),
  ];
}
