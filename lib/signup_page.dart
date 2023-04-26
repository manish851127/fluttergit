import 'package:firebase_project/login_page.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupPage();
  }

}
class _SignupPage extends State<SignupPage>{

   FirebaseAuth _auth= FirebaseAuth.instance;
   final _formkey= GlobalKey<FormState>();
  var emailText = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/signup.png'),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16,
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('assets/images/profile1.png'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5),
                                )
                              ]),
                          child: TextFormField(
                            style: TextStyle(fontSize: 25),
                            controller: emailText,
                            enabled: true,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'please enter email address';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white, width: 1),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                              ),
                              labelText: 'User Id',
                              labelStyle: TextStyle(fontSize: 25),
                              // suffixText: 'User Id',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.email_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5),
                                )
                              ]),
                          child: TextFormField(
                            style: TextStyle(fontSize: 25),
                            controller: password,
                            obscureText: true,
                            enabled: true,

                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'please enter password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white, width: 1),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 25),
                              // suffixText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(20),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           blurRadius: 10,
                        //           offset: Offset(1, 1),
                        //           color: Colors.grey.withOpacity(0.5),
                        //         )
                        //       ]),
                        //   child: TextFormField(
                        //     controller: confirmpassword,
                        //     obscureText: true,
                        //     enabled: true,
                        //     keyboardType: TextInputType.visiblePassword,
                        //     validator: (value){
                        //       if(value!.isEmpty){
                        //         return 'please enter confirm password';
                        //       }
                        //       return null;
                        //     },
                        //     decoration: InputDecoration(
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(20),
                        //         borderSide: BorderSide(color: Colors.white, width: 1),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(20),
                        //         borderSide: BorderSide(color: Colors.white, width: 1),
                        //       ),
                        //       disabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(20),
                        //         borderSide:
                        //         BorderSide(color: Colors.black38, width: 1),
                        //       ),
                        //       labelText: 'Confirm Password',
                        //       suffixText: 'Confirm Password',
                        //       suffixIcon: IconButton(
                        //         icon: Icon(Icons.remove_red_eye),
                        //         onPressed: () {},
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ],
                              image: DecorationImage(
                                  image: AssetImage('assets/images/loginbtn.png'),
                                  fit: BoxFit.fill)),
                          child: TextButton(
                            onPressed: () {
                              if(_formkey.currentState!.validate()){
                                  _auth.createUserWithEmailAndPassword(
                                      email: emailText.text.toString(),
                                      password: password.text.toString(),
                                  ).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()))).onError((error, stackTrace) {Utils().toastMessage(error.toString());});
                              }
                            },
                            child: Text(
                              'SignUp',
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.1,
                              ),
                              Text(
                                'Signup one of following method  Or',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                              }, child: Text('Login'))

                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/images/g.png'),
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/images/f.png'),
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/images/t.png'),
                                ),
                              ),
                            ],),
                        )
                      ]),
                ),
              ]),
            )));

  }

}