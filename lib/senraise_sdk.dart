
import 'dart:typed_data';

import 'senraise_sdk_platform_interface.dart';

class SenraiseSdk {
  Future<void> printImage(Uint8List image) async {
    return await SenraiseSdkPlatform.instance.printImage(image);
  }

  Future<void> printText(String text) async {
    return await SenraiseSdkPlatform.instance.printText(text);
  }

  Future<void> setTextSize(double textSize) async {
    return await SenraiseSdkPlatform.instance.setTextSize(textSize);
  }
}
