import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import 'common_widgets.dart';

class EPSimpleButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double height, fontSize, width;

  const EPSimpleButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.height = 58,
    this.width = 67,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.zero,
        backgroundColor: HexColor("#F1F2FF"),
      ),
      child: EPTextWidget(
        text: text,
        textSize: fontSize,
        textColor: HexColor("#4448AE"),
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
