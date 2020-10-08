import 'package:flutter/material.dart' show runApp;
import 'package:flutter/widgets.dart';
import 'app.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class ConnectivityOverlay {
  static final ConnectivityOverlay _singleton = ConnectivityOverlay._internal();

  factory ConnectivityOverlay() {
    return _singleton;
  }

  ConnectivityOverlay._internal();

  static OverlayEntry overlayEntry;

  void showOverlay(BuildContext context, Widget child) {
    // реализуйте отображение Overlay.
  }

  void removeOverlay(BuildContext context) {
// реализуйте удаление Overlay.
  }
}
