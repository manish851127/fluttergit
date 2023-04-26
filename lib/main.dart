import 'package:firebase_project/UI/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCMHC3hUNlNH0vD2RSp-4cK2qHRziQo-WY",
            authDomain: "fir-project-1-ad82c.firebaseapp.com",
            databaseURL: "https://fir-project-1-ad82c-default-rtdb.firebaseio.com",
            projectId: "fir-project-1-ad82c",
            storageBucket: "fir-project-1-ad82c.appspot.com",
            messagingSenderId: "344021917622",
            appId: "1:344021917622:web:c7e047ccda5e014131ab17"
        )
    );
  }
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
               primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white
      ),
      home: const SplashScreen(),
    );
  }
}

