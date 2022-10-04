import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storagesecured/model/auth_model.dart';

class LocalSecureStorage{

  LocalSecureStorage._();

  // factory LocalSecureStorage(){
  //   return _singleton;
  // }
  //
  // static final  LocalSecureStorage _singleton = LocalSecureStorage._internal();

  /// android settings
  static const AndroidOptions androidOptions =
  AndroidOptions(encryptedSharedPreferences: true);
  /// iOS settings
  static const IOSOptions iosOptions =
  IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  static const FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: androidOptions,iOptions: iosOptions
  );

  static Future setUserModel(String key,AuthModel val) async{
    var buffer = json.encode(val);
    await storage.write(key: 'authmodel', value: buffer);
  }

  static Future getUserModel() async{
  var data =   await storage.read(key: 'authmodel');
  return data;
  }

  static Future removeUserModel() async{
    await storage.delete(key: 'authmodel');
  }

  static Future clearAll() async{
  return  await storage.deleteAll();
  }





}