import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/api/host_api.dart',
    javaOut: 'android/src/main/java/com/wipaytoday/senraise_sdk/SenraiseSdkHostApi.java',
    javaOptions: JavaOptions(
      package: 'com.wipaytoday.senraise_sdk'
    )
  )
)

@HostApi()
abstract class IHostApi {
  void printText(String text);
  void printImage(Uint8List bytes);
  void printTestPage();
  void setTextSize(double textSize);
}