import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:senraise_sdk/senraise_sdk_platform_interface.dart';
import 'package:senraise_sdk/senraise_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSenraiseSdkPlatform
    with MockPlatformInterfaceMixin
    implements SenraiseSdkPlatform {

  @override
  Future<void> printImage(Uint8List image) {
    // TODO: implement printImage
    throw UnimplementedError();
  }

  @override
  Future<void> printText(String text) {
    // TODO: implement printText
    throw UnimplementedError();
  }
  
  @override
  Future<void> printTestPage() {
    // TODO: implement printTestPage
    throw UnimplementedError();
  }
  
  @override
  Future<void> setTextSize(double textSize) {
    // TODO: implement setTextSize
    throw UnimplementedError();
  }
}

void main() {
  final SenraiseSdkPlatform initialPlatform = SenraiseSdkPlatform.instance;

  test('$MethodChannelSenraiseSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSenraiseSdk>());
  });
}
