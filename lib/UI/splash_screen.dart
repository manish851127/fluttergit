import 'package:flutter/material.dart';

import '../firebase_services/splace_services.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }

}
class _SplashScreen extends State<SplashScreen>{
  SplashDevices splashscreen= SplashDevices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,body: Center(child: Text('Splash Screen', style: TextStyle(color: Colors.red,fontSize: 40),),));
  }

}