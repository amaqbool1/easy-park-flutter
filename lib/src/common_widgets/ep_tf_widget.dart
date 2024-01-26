import 'package:easy_park/src/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class EPTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool? obscureText;
  final Function(String)? onChange, onSubmitted;
  final Function()? mPostFixIconOnTap, onPrefixIconOnTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool hideSuffixWidget;
  final String? prefixSvg, postfixSvg, hintText;

  const EPTextFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.textInputType,
    required this.textInputAction,
    this.obscureText,
    this.onChange,
    this.onSubmitted,
    this.inputFormatters,
    this.hideSuffixWidget = false,
    this.postfixSvg,
    this.prefixSvg,
    this.hintText,
    this.mPostFixIconOnTap,
    this.onPrefixIconOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        cursorWidth: 0.5,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        cursorColor: AppColors.tfBorder,
        obscureText: obscureText ?? false,
        inputFormatters: inputFormatters,
        onChanged: onChange,
        onFieldSubmitted: onSubmitted,
        style: const TextStyle(
          color: AppColors.tfBorder,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: AppColors.tfBackground,
          filled: true,
          hintText: hintText ?? "",
          hintStyle: GoogleFonts.urbanist(
            fontSize: 12,
            color: CupertinoColors.inactiveGray,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.tfBorder,
              width: 1,
            ),
          ),
          isDense: true,
          prefixIcon: prefixSvg == null
              ? hintText == null
                  ? null
                  : Icon(
                      Icons.person,
                      color: HexColor("#9E9E9E"),
                    )
              : IconButton(
                  onPressed: onPrefixIconOnTap,
                  icon: SvgPicture.asset(
                    prefixSvg!,
                  ),
                ),
          suffixIcon: postfixSvg == null
              ? null
              : IconButton(
                  onPressed: mPostFixIconOnTap,
                  icon: SvgPicture.asset(
                    postfixSvg!,
                  ),
                ),
        ),
      ),
    );
  }
}
