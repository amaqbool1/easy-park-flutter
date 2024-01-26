import 'package:easy_park/src/extensions/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;

  LoadingOverlay();

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => SafeArea(
          child: Container(
            color: Colors.white.withOpacity(0.8),
            child: Center(
              child: SpinKitWave(
                color: HexColor("#4448AE"),
                size: 40.0,
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}
