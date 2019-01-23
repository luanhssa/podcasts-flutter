import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Common {
  Widget navigationBar(String title) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(title),
      backgroundColor: Colors.white,
      border: Border.all(color: Colors.white),
    );
  }

  hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
