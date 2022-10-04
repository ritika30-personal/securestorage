import 'package:flutter/material.dart';
import 'package:storagesecured/localStorage/local_storage.dart';
import 'package:storagesecured/model/auth_model.dart';
import 'package:storagesecured/view/splashpage/authview.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home View'),
        actions: [
          InkWell(
            onTap: () async{
             await LocalSecureStorage.clearAll();
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
               return AuthViewPage();
             }));
            },
            child: Icon(Icons.login_outlined),
          )
        ],
      ),
    );
  }
}
