import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/firebase_services/verify_code.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:firebase_project/widgets/round_button.dart';
import 'package:flutter/material.dart';
class LoginWithPhoneNumber extends StatefulWidget{
  const LoginWithPhoneNumber({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginWithPhoneNumber();
  }

}
class _LoginWithPhoneNumber extends State<LoginWithPhoneNumber>{
  final phoneNumberController= TextEditingController();
  bool loading= false;
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Login with phone number'),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(height: 80,),
          TextFormField(
            style: TextStyle(fontSize: 25),
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: '+1 234 3456 33',
            ),

          ),
          SizedBox(height: 35,),
          RoundButton(title: 'Login',loading: loading, onTab: (){
                setState(() {
                  loading=true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,

                    verificationCompleted: (_){
                      setState(() {
                        loading=false;
                      });
                    },
                    verificationFailed: (e){
                      Utils().toastMessage(e.toString());
                      setState(() {
                        loading=false;
                      });
                    },
                    codeSent: (String verificationId, int? token){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyCodeScreen(verificationId: verificationId,)));
                      setState(() {
                        loading=false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e){
                      Utils().toastMessage(e.toString());
                    }
                );
              }
          )
        ],
      ),
    ),
  );
  }

}