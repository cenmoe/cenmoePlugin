// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';

import 'package:flutter/services.dart';

class CenmoePlugin {
  static const MethodChannel _channel =
      const MethodChannel('cenmoe_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion',{"adb":"2333"});
    return version;
  }
  static Future<String> savePicture(String path) async{
    final String version = await _channel.invokeMethod('savePicture',{"path":path});
    return version;
  }

  static Future getPhoneCode(String phoneNumber,String zone,String tempCode, Function(dynamic ret,Map err)result) {

    Map args = {"phoneNumber": phoneNumber, "zone":zone, "tempCode":tempCode};

    Future<dynamic> callback = _channel.invokeMethod('getTextCode', args);

    callback.then((dynamic response){
      if(result != null)
      {
        if(response is Map)
        {
          result(response["ret"],response["err"]);
        }
        else
        {
          result(null,null);
        }
      }
    });

    return callback;
  }
}
