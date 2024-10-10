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
  void setLineHeight(double lineHeight);
  void print128BarCode(String data, int type, int height, int width);
  void setTextDoubleWidth(bool enable);
  void setTextDoubleHeight(bool enable);
  void printEpson(Uint8List data);
  void setAlignment(int alignment);
  void nextLine(int line);
  void printTableText(List<String> text, List<int> weight, List<int> alignment);
  void setTextBold(bool bold);
}