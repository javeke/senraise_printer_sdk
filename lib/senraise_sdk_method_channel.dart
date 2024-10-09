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
}
