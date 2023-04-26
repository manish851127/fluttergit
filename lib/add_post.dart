import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:firebase_project/widgets/round_button.dart';
import 'package:flutter/material.dart';
class AddPostScreen extends StatefulWidget{
  const AddPostScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddPost();
  }

}
class _AddPost extends State<AddPostScreen>{
  var textFilledController = TextEditingController();
  // var emailController=TextEditingController();
  // bool loading = false;
  final databaseRef=FirebaseDatabase.instance.ref('post');
  // final emailDatabaseRef=FirebaseDatabase.instance.ref('title');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
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
                  var dateTime=DateTime.now().millisecond.toString();
                  databaseRef.child(dateTime).set({
                    'name': textFilledController.text.toString(),
                    'id': dateTime
                  }).then((value) => Utils().toastMessage('post added'))
                  .onError((error, stackTrace) => Utils().toastMessage(error.toString()));
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
