import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:firebase_project/widgets/round_button.dart';
import 'package:flutter/material.dart';
class AddFireStoreData extends StatefulWidget{
  const AddFireStoreData({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddFireStoreData();
  }

}
class _AddFireStoreData extends State<AddFireStoreData>{
  bool loading = false;

  var textFilledController = TextEditingController();
  final firestore= FirebaseFirestore.instance.collection('users');
    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Add FireStore Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextFormField(
              controller: textFilledController,
              maxLines: 5,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.greenAccent),
                  ),
                  hintText: 'Write the post'
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(height: 30,),
            RoundButton(
                title: 'Add',
                onTab: (){
                   setState(() {
                     loading= true;
                   });
                   String id= DateTime.now().millisecond.toString();
                  firestore.doc(id).set({
                    'title': textFilledController.text.toString(),
                    'id': id
                  }).then((value){
                    setState(() {
                      loading= false;
                    });
                    Utils().toastMessage('Post Added');

                  }).onError((error, stackTrace){
                    setState(() {
                      loading= false;
                    });
                    Utils().toastMessage(error.toString());
                  });
                  }
            )
            // RoundButton(
            //     onTa
            //
            //       // var dateTime=DateTime.now().millisecond.toString();
            //       databaseRef.child('add').set({
            //         'name': textFilledController.text.toString(),
            //          // 'email': emailController.text.toString(),
            //         'id': 1,
            //
            //       }).then((value) => Utils().toastMessage('added'));
            //     }
            //     , title: 'Add',
            //     )
          ],
        ),
      ),
    );


  }

}
