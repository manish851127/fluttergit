import 'package:flutter/material.dart';

import 'add_college_data.dart';
class CollegeCategory extends StatefulWidget{
  const CollegeCategory({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CollegeCategory();
  }

}
class _CollegeCategory extends State<CollegeCategory>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text('College Category'),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddCollegeData()));
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            height: 150,
                            child: Card(
                              elevation: 2.0,

                              child: Center(child: Text('Engineering',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Management',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Medical',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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

                              child: Center(child: Text('Mass Communication',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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

                              child: Center(child: Text('Design',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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

                              child: Center(child: Text('Law',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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

                              child: Center(child: Text('Architecture',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Computers',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Arts & Humanities',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Commerce',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Science',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Hotel Management',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Teaching',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Pharmacy',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
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
                              child: Center(child: Text('Travel & Tourism',style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)),)),
                      )
                  ),
                ],
              ),


            ],
          ),
        )
    );
  }

}