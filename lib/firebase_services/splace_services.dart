import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/firestore1/category.dart';
import 'package:firebase_project/login_page.dart';
import 'package:flutter/material.dart';

import '../firestore1/collgege_category/enineering_colleges.dart';

class SplashDevices{
  void isLogin(BuildContext context){
    final auth= FirebaseAuth.instance;
    final user= auth.currentUser;
    if(user!= null){
      Timer(Duration(seconds: 1),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeScreen()))
      );
    }
    else{
      Timer(Duration(seconds: 1),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()))
      );
    }

  }
}