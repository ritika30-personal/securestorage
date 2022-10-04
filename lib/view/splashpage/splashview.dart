import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storagesecured/localStorage/local_storage.dart';
import 'package:storagesecured/view/homeview/homeview.dart';
import 'package:storagesecured/viewmodel/authmodelValue.dart';
import 'package:storagesecured/view/splashpage/authview.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Provider.of<AuthViewModel>(context, listen: false).topHeadings();

    Future.delayed(
      const Duration(seconds: 5,),
          ()=> getFetched());
    super.initState();
  }

  getFetched() async{
     var data = Provider.of<AuthViewModel>(context,listen: false);
     var dataLocal  =await LocalSecureStorage.getUserModel();
     var fixDatas =json.encode(data.authModel).toString();
     if(data.authModel != null){
       if(dataLocal != null){
        if (dataLocal == fixDatas) {
               Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return const HomeViewPage();
            }),
          );
        }
      }else{
        return Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context){
           return const  AuthViewPage();
         }),);
       }
    }else{
       Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context){
         return const  AuthViewPage();
       }),);
     }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xff59fde4),
      child: Center(
        child: Icon(Icons.home_filled,size: 40,color: Colors.white,),
      ),
    );
  }
}
