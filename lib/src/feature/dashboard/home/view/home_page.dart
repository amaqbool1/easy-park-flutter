import 'package:flutter/material.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  final int pageIndex;

  const HomePage({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return HomeView(
      pageIndex: pageIndex,
    );
  }
}
