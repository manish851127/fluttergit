import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/UI/home_page.dart';
import 'package:flutter/material.dart';

import '../utils/Utils.dart';
import '../widgets/round_button.dart';
class VerifyCodeScreen extends StatefulWidget{
final  String verificationId;
  const VerifyCodeScreen({super.key,required this.verificationId});

  @override
  State<StatefulWidget> createState() {
    return _VerifyCodeScreen();
  }

}
class _VerifyCodeScreen extends State<VerifyCodeScreen>{

  final verificationCodeController= TextEditingController();
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
              controller: verificationCodeController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '+1 234 3456 33',
              ),

            ),
            SizedBox(height: 35,),
            RoundButton(title: 'verify',loading: loading, onTab: () async{
              setState(() {
                loading =true;
              });
              final credentials=PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verificationCodeController.text.toString(),
              );
              try{
              await auth.signInWithCredential(credentials);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              }catch(e){
                setState(() {
                  loading =false;
                });
                Utils().toastMessage(e.toString());

              }
            }
            )
          ],
        ),
      ),
    );
  }

}