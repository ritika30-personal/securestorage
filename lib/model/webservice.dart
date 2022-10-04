import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:storagesecured/model/auth_model.dart';

class WebServices{

  Future getUserDetails() async{
    try{
      var rootData = await rootBundle.loadString('assets/json/authdata.json');
      var res = json.decode(rootData);
      AuthModel model = AuthModel(username: res['username'],
          password: res['password']);
      return model;
    }catch(e){e.toString();}
  }

}