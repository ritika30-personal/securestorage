import 'package:flutter/cupertino.dart';
import 'package:storagesecured/model/auth_model.dart';
import 'package:storagesecured/model/webservice.dart';

enum LoadingStatus { notRegistered, registered, none }

class AuthViewModel with ChangeNotifier{

  LoadingStatus status = LoadingStatus.none;
  AuthModel? authModel;

  void topHeadings() async {
  var authData = await WebServices().getUserDetails();
  status = LoadingStatus.none;
  notifyListeners();

  authModel = authData;
  if(authModel != null && authModel!.username != null){

  status = LoadingStatus.registered;
  } else {
  status = LoadingStatus.notRegistered;
  }

  notifyListeners();
  }


}