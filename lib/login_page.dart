import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/UI/home_page.dart';
import 'package:firebase_project/firebase_services/login_with_phone_number.dart';
import 'package:firebase_project/firestore1/category.dart';
import 'package:firebase_project/firestore1/collgege_category/enineering_colleges.dart';
import 'package:firebase_project/signup_page.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }

}
class _LoginPage extends State<LoginPage>{
  Future signIn() async {
    showDialog(context: context, builder: (context){
      return CircularProgressIndicator();
    });
  }
  var emailText = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                width:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/loginimg.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('HELLO',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('sign into your account',style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),),
                    SizedBox(height: 50,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.5),
                            )
                          ]
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        controller: emailText,
                        enabled: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(20) ,
                            borderSide:BorderSide(color: Colors.white ,width: 1 ) ,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20) ,
                            borderSide:BorderSide(color: Colors.white, width: 1) ,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black38, width: 1),
                          ),
                          labelText: 'User Id',
                          labelStyle: TextStyle(fontSize: 15),
                          // suffixText: 'User Id',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.email_outlined),
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.5),
                            )
                          ]
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        controller: password,
                        obscureText: true,
                        enabled: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(20) ,
                            borderSide:BorderSide(color: Colors.white ,width: 1 ) ,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20) ,
                            borderSide:BorderSide(color: Colors.white, width: 1) ,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black38, width: 1),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 15),
                          // suffixText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2,),
                    Container(alignment: Alignment.topRight,child: TextButton(onPressed: (){}, child: Text('Forget your password',textAlign: TextAlign.end,style: TextStyle(fontSize: 15),))),
                    SizedBox(height: 5,)
                  ],
                ),
              ),
              Container(

                height: MediaQuery.of(context).size.height*0.065,
                width:  MediaQuery.of(context).size.width*0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: Offset(1,1),
                        color: Colors.grey.withOpacity(0.5),
                      ), ],
                    image: DecorationImage(
                        image: AssetImage('assets/images/loginbtn.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: TextButton(onPressed: (){
                  setState(() {
                    loading=true;
                  });
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: emailText.text, password: password.text)
                      .then((value) {
                        Utils().toastMessage(value.user!.email.toString());
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CollegeScreen()));
                      setState(() {
                        loading=false;
                      });
                  })
                      .onError((error, stackTrace) {Utils().toastMessage(error.toString());});
                  setState(() {
                    loading=false;
                  }
                  );
                },child: loading ?CircularProgressIndicator(color: Colors.white,): Text('Login',style: TextStyle(color: Colors.white,fontSize: 25),),)

              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginWithPhoneNumber()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.black,
                        width: 2,
                      )
                  ),
                  child: Center(
                    child: Text('Login with phone number'),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.09,),
                    Text('Don/t have an account?',style: TextStyle(fontSize: 18,color: Colors.grey),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                    }, child: Text('Create',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)),
                  ],
                ),),

            ]
        ),
      ),
    );

  }

}


