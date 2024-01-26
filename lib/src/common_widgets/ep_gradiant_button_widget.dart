import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import 'common_widgets.dart';

class EPGradiantButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double height, fontSize, width;

  const EPGradiantButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.height = 58,
    this.width = 67,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor("#D0CBF1"),
                HexColor("#989BF0"),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: width,
              minHeight: height,
            ),
            alignment: Alignment.center,
            child: EPTextWidget(
              text: text,
              textSize: fontSize,
              textColor: HexColor("#FFFFFF"),
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
