import 'package:flutter/material.dart';
import 'package:storagesecured/localStorage/local_storage.dart';
import 'package:storagesecured/model/auth_model.dart';
import 'package:storagesecured/view/homeview/homeview.dart';

class AuthViewPage extends StatefulWidget {
  const AuthViewPage({Key? key}) : super(key: key);

  @override
  State<AuthViewPage> createState() => _AuthViewPageState();
}

class _AuthViewPageState extends State<AuthViewPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("Username",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),),
                Card(
                  shape: const StadiumBorder(),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Your username",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),
                const Text("Password",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),),
                Card(
                  shape: const StadiumBorder(),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: "Your password",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),

              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RawMaterialButton(
                    onPressed: (){
                      LocalSecureStorage.setUserModel('authmodel', AuthModel(
                        username: nameController.text,
                        password: passwordController.text
                      ));
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                        return HomeViewPage();
                      }));
                    },
                    fillColor: Colors.cyanAccent,
                    textStyle:const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                    shape:const StadiumBorder(),
                    child:const Text("Login"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
