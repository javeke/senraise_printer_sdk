
import 'dart:typed_data';

import 'package:senraise_sdk/types.dart';

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

  Future<void> print128BarCode(String data, int type, int height, int width) async {
    return await SenraiseSdkPlatform.instance.print128BarCode(data, type, height, width);
  }
  
  Future<void> setLineHeight(double lineHeight) async {
    return await SenraiseSdkPlatform.instance.setLineHeight(lineHeight);
  }
  
  Future<void> setTextDoubleHeight(bool enable) async {
    return await SenraiseSdkPlatform.instance.setTextDoubleHeight(enable);
  }
  
  Future<void> setTextDoubleWidth(bool enable) async {
    return await SenraiseSdkPlatform.instance.setTextDoubleWidth(enable);
  }

  Future<void> printEpson(Uint8List data) async {
    return await SenraiseSdkPlatform.instance.printEpson(data);
  }

  Future<void> setAlignment(int alignment) async {
    return await SenraiseSdkPlatform.instance.setAlignment(alignment);
  }

  Future<void> nextLine(int line) async {
    return await SenraiseSdkPlatform.instance.nextLine(line);
  }

  Future<void> printTableText(List<String> text, Int32List weight, Int32List alignment) async {
    return await SenraiseSdkPlatform.instance.printTableText(text, weight, alignment);
  }

  Future<void> setTextBold(bool bold) async {
    return await SenraiseSdkPlatform.instance.setTextBold(bold);
  }

  Future<void> printPage(PrintData page) async {
    return await SenraiseSdkPlatform.instance.printPage(page);
  }
}
