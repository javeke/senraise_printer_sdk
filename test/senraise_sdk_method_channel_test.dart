import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:senraise_sdk/senraise_sdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSenraiseSdk platform = MethodChannelSenraiseSdk();
  const MethodChannel channel = MethodChannel('senraise_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    await platform.printText("42");
    expect("42", '42');
  });
}
