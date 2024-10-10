import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:senraise_sdk/src/api/host_api.dart';

import 'senraise_sdk_platform_interface.dart';

class MethodChannelSenraiseSdk extends SenraiseSdkPlatform {
  final IHostApi _hostApi = IHostApi();

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('senraise_sdk');

  @override
  Future<void> printImage(Uint8List image) async {
    return await _hostApi.printImage(image);
  }
  
  @override
  Future<void> printText(String text) async {
    return await _hostApi.printText(text);
  }

  @override
  Future<void> printTestPage() async {
    return await _hostApi.printTestPage();
  }

  @override
  Future<void> setTextSize(double textSize) async {
    return await _hostApi.setTextSize(textSize);
  }
  
  @override
  Future<void> print128BarCode(String data, int type, int height, int width) async {
    return await _hostApi.print128BarCode(data, type, height, width);
  }
  
  @override
  Future<void> setLineHeight(double lineHeight) async {
    return await _hostApi.setLineHeight(lineHeight);
  }
  
  @override
  Future<void> setTextDoubleHeight(bool enable) async {
    return await _hostApi.setTextDoubleHeight(enable);
  }
  
  @override
  Future<void> setTextDoubleWidth(bool enable) async {
    return await _hostApi.setTextDoubleWidth(enable);
  }

  @override
  Future<void> printEpson(Uint8List data) async {
    return await _hostApi.printEpson(data);
  }

  @override
  Future<void> setAlignment(int alignment) async {
    return await _hostApi.setAlignment(alignment);
  }

  @override
  Future<void> nextLine(int line) async {
    return await _hostApi.nextLine(line);
  }

  @override
  Future<void> printTableText(List<String> text, List<int> weight, List<int> alignment) async {
    return await _hostApi.printTableText(text, weight, alignment);
  }

  @override
  Future<void> setTextBold(bool bold) async {
    return await _hostApi.setTextBold(bold);
  }
}
