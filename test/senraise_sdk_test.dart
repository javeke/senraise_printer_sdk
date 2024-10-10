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
  
  @override
  Future<void> print128BarCode(String data, int type, int height, int width) {
    // TODO: implement print128BarCode
    throw UnimplementedError();
  }
  
  @override
  Future<void> setLineHeight(double lineHeight) {
    // TODO: implement setLineHeight
    throw UnimplementedError();
  }
  
  @override
  Future<void> setTextDoubleHeight(bool enable) {
    // TODO: implement setTextDoubleHeight
    throw UnimplementedError();
  }
  
  @override
  Future<void> setTextDoubleWidth(bool enable) {
    // TODO: implement setTextDoubleWidth
    throw UnimplementedError();
  }
  
  @override
  Future<void> nextLine(int line) {
    // TODO: implement nextLine
    throw UnimplementedError();
  }
  
  @override
  Future<void> printEpson(Uint8List data) {
    // TODO: implement printEpson
    throw UnimplementedError();
  }
  
  @override
  Future<void> printTableText(List<String> text, List<int> weight, List<int> alignment) {
    // TODO: implement printTableText
    throw UnimplementedError();
  }
  
  @override
  Future<void> setAlignment(int alignment) {
    // TODO: implement setAlignment
    throw UnimplementedError();
  }
  
  @override
  Future<void> setTextBold(bool bold) {
    // TODO: implement setTextBold
    throw UnimplementedError();
  }
}

void main() {
  final SenraiseSdkPlatform initialPlatform = SenraiseSdkPlatform.instance;

  test('$MethodChannelSenraiseSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSenraiseSdk>());
  });
}
