import 'package:firebase_project/firestore1/collgege_category/college_category.dart';
import 'package:flutter/material.dart';
class Category extends StatefulWidget{
  const Category({super.key});

  @override
  State<StatefulWidget> createState() {
   return _Category();
  }

}
class _Category extends State<Category>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Developer Admin Pannel',),
      ),
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 30),
             child: Center(
               child: Text('Select any category',style: TextStyle(fontSize: 25,decoration: TextDecoration.underline),),
             ),
           ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                   flex: 1,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CollegeCategory()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        child: Card(
                          elevation: 2.0,
                           child: Center(child: Text('Colleges',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),))

                     )
                  ),
                  )
              ),
              Expanded(
                   flex: 1,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        child: Card(
                          elevation: 2.0,
                          child: Center(child: Text('Courses',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
                  )
              ),

            ],
          ),
          Row(
            children: [
              Expanded(
                   flex: 1,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        child: Card(
                          elevation: 2.0,
                          child: Center(child: Text('Reviews',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
                  )
              ),
              Expanded(
                   flex: 1,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        child: Card(
                          elevation: 2.0,

                          child: Center(child: Text('Phychometric Test',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
                  )
              ),

            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        child: Card(
                          elevation: 2.0,

                          child: Center(child: Text('Guided Admission',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
                  )
              ),


            ],
          ),

        ],
      )
    );
  }

}