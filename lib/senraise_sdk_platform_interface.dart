import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:senraise_sdk/types.dart';

import 'senraise_sdk_method_channel.dart';

abstract class SenraiseSdkPlatform extends PlatformInterface {
  /// Constructs a SenraiseSdkPlatform.
  SenraiseSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static SenraiseSdkPlatform _instance = MethodChannelSenraiseSdk();

  /// The default instance of [SenraiseSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSenraiseSdk].
  static SenraiseSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SenraiseSdkPlatform] when
  /// they register themselves.
  static set instance(SenraiseSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> printImage(Uint8List image){
    throw UnimplementedError('printImage() has not been implemented.');
  }

  Future<void> printText(String text){
    throw UnimplementedError('printText() has not been implemented.');
  }

  Future<void> printTestPage() {
    throw UnimplementedError('printTestPage() has not been implemented.');
  }

  Future<void> setTextSize(double textSize){
    throw UnimplementedError('setTextSize() has not been implemented.');
  }

  Future<void> setLineHeight(double lineHeight){
    throw UnimplementedError('setLineHeight() has not been implemented');
  }

  Future<void> print128BarCode(String data, int type, int height, int width){
    throw UnimplementedError('print128BarCode() has not been implemented');
  }

  Future<void> setTextDoubleWidth(bool enable){
    throw UnimplementedError('setTextDoubleWidth() has not been implemented');
  }

  Future<void> setTextDoubleHeight(bool enable){
    throw UnimplementedError('setTextDoubleHeight() has not been implemented');
  }

  Future<void> printEpson(Uint8List data){
    throw UnimplementedError('printEpson() has not been implemented');
  }

  Future<void> setAlignment(int alignment){
    throw UnimplementedError('setAlignment() has not been implemented');
  }

  Future<void> nextLine(int line){
    throw UnimplementedError('nextLine() has not been implemented');
  }

  Future<void> printTableText(List<String> text, List<int> weight, List<int> alignment){
    throw UnimplementedError('printTableText() has not been implemented');
  }

  Future<void> setTextBold(bool bold){
    throw UnimplementedError('setTextBold() has not been implemented');
  }

  Future<void> printPage(PrintData page){
    throw UnimplementedError('printPage() has not been implemented');
  }
}
