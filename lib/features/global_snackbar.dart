import 'package:flutter/material.dart';

/// Build a SnackBar that can be accessed anywhere in the system.
class GlobalSnackBar {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static show(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message))
    );
  }
}
