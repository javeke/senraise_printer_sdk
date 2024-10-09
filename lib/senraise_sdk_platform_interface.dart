import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

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
}
