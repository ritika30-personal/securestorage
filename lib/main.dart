import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:storagesecured/viewmodel/authmodelValue.dart';
import 'package:storagesecured/view/splashpage/splashview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
         providers: [
           ChangeNotifierProvider(
             create: (_) => AuthViewModel(),
           )
         ],
       child: const SplashView(),
      ),

    );
  }
}

