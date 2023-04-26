import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/firestore1/category.dart';
import 'package:firebase_project/firestore1/collgege_category/add_college_data.dart';
import 'package:firebase_project/firestore1/collgege_category/card_list.dart';
import 'package:firebase_project/firestore1/collgege_category/college_home_screen.dart';
import 'package:flutter/material.dart';
import '../../login_page.dart';
class CollegeScreen extends StatefulWidget{
  const CollegeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CollegeScreen();
  }

}
class _CollegeScreen extends State<CollegeScreen>{
  final firestore= FirebaseFirestore.instance.collection('college').snapshots();
  final ref= FirebaseFirestore.instance.collection('college');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text('College Screen'),
          actions: [
            ElevatedButton(
              child: const Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
            ),
            TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));}, child: Text('Admin',style: TextStyle(fontSize: 17,color: Colors.white),))
          ],
        ),

        body: Column(
          children: [
            SizedBox(height: 10),
            StreamBuilder(
                stream: firestore,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.hasError){
                    return Text('Error Found');
                  }
                  return Flexible(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            final name=snapshot.data!.docs[index]['name'];
                            final duration=snapshot.data!.docs[index]['duration'];
                            final fees=snapshot.data!.docs[index]['fees'];
                            final institute=snapshot.data!.docs[index]['institute'];
                            final placement=snapshot.data!.docs[index]['placement'];
                            final image=snapshot.data!.docs[index]['image'];
                            return Expanded(
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> cardList()));
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      height: 355,
                                      child: Card(
                                        elevation: 2.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10,),
                                              Text(name,style: TextStyle(fontSize: 20,color: Colors.deepOrange,fontWeight: FontWeight.bold,),),
                                              SizedBox(height: 10),
                                              Container(
                                                width: MediaQuery.of(context).size.width*0.9,
                                                height: 100,
                                                color: Colors.grey,
                                                child: Image.network(image,fit: BoxFit.fill,),
                                              ),
                                              SizedBox(height: 10),
                                              Row(children: [
                                                Expanded(child: Text('Duration: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),)),
                                                SizedBox(height: 10,),
                                                Expanded(child: Text(duration,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),))
                                              ],),
                                              SizedBox(height: 10),
                                              Row(children: [
                                                Expanded(child: Text('Total Fees: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),)),
                                                Expanded(child: Text(fees,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),))
                                              ],),
                                              SizedBox(height: 10),
                                              Row(children: [
                                                Expanded(child: Text('Institute Type: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),)),
                                                Expanded(child: Text(institute,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),))
                                              ],),
                                              SizedBox(height: 10),
                                              Row(children: [
                                                Expanded(child: Text('Placements: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),)),
                                                Expanded(child: Text(placement,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),))
                                              ],),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),


                            );
                          }
                      )
                  );

                }
            ),

          ],
        )
    );
  }

}