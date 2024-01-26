import 'package:easy_park/src/common_widgets/common_widgets.dart';
import 'package:easy_park/src/constants/app_sizes.dart';
import 'package:easy_park/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EpOutlinedButton extends StatelessWidget {
  final String buttonText, svgPath;
  final Function()? mOnTap;
  final bool showIconButtonOnly, showTextOnly;
  final double width, height, fontSize;
  final Color borderColor;

  const EpOutlinedButton({
    super.key,
    required this.buttonText,
    required this.svgPath,
    required this.mOnTap,
    required this.width,
    this.height = 60,
    this.fontSize = 16.0,
    required this.showTextOnly,
    required this.borderColor,
    required this.showIconButtonOnly,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: mOnTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor,
          width: showTextOnly ? 2 : 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: showTextOnly
              ? BorderRadius.circular(100)
              : BorderRadius.circular(8),
        ),
        fixedSize: Size(
          width,
          height,
        ),
      ),
      child: showTextOnly
          ? EPTextWidget(
              text: buttonText,
              textSize: fontSize,
              textColor: showTextOnly ? borderColor : HexColor("#212121"),
              fontWeight: FontWeight.w600,
            )
          : showIconButtonOnly
              ? SvgPicture.asset(
                  svgPath,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      svgPath,
                    ),
                    gapW12,
                    EPTextWidget(
                      text: buttonText,
                      textSize: 16.0,
                      textColor: HexColor("#212121"),
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
    );
  }
}
