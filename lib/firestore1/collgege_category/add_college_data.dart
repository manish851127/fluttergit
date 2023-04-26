
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/firestore1/collgege_category/enineering_colleges.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AddCollegeData extends StatefulWidget{
  const AddCollegeData({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddCollegeData();
  }

}
class _AddCollegeData extends State<AddCollegeData>{
  String imageUrl='';
  File? profilePic;
  Uint8List webImage= Uint8List(8);
  final nameController=TextEditingController();
  final durationController=TextEditingController();
  final feeController=TextEditingController();
  final instituteController=TextEditingController();
  final placementController=TextEditingController();

  final firestore= FirebaseFirestore.instance.collection('college');

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.grey.shade50,
     appBar: AppBar(
       title: Text('Add Collge Data'),
     ),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             TextFormField(
               controller: nameController,
               maxLines: 1,
               decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.grey),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.blue)
                   ),
                   hintText: 'Enter name of College'
               ),
             ),
             SizedBox(height: 10,),

             TextFormField(
               controller: durationController,
               maxLines: 1,
               decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.grey),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.blue)
                   ),
                   hintText: 'Enter duration of course'
               ),
             ),
             SizedBox(height: 10,),

             TextFormField(
               controller: feeController,
               maxLines: 1,
               decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.grey),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.blue)
                   ),
                   hintText: 'Enter total fees'
               ),
             ),
             SizedBox(height: 10,),

             TextFormField(
               controller: instituteController,
               maxLines: 1,
               decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.grey),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.blue)
                   ),
                   hintText: 'Enter institute type'
               ),
             ),
             SizedBox(height: 10,),

             TextFormField(
               controller: placementController,
               maxLines: 1,
               decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.grey),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2,color: Colors.blue)
                   ),
                   hintText: 'Enter highest placement'
               ),
             ),
             SizedBox(height: 10,),






             ElevatedButton.icon(
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.red)
                 ),
                 onPressed: () async {
                   if(!kIsWeb){
                     ImagePicker imagePicker=ImagePicker();
                     XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                     debugPrint('${file?.path}');
                     if(file==null){
                       return;
                     }
                     String uniqueName= DateTime.now().microsecondsSinceEpoch.toString();
                     //get the reference to storage root
                     final referenceRoot= FirebaseStorage.instance.ref();
                     final referenceDirImg= referenceRoot.child('images');
                     //Create the reference to for the image to be stored
                     final referenceImageToStore=referenceDirImg.child(uniqueName);
                     //Handle error/success
                     try{
                       //Store file
                       await  referenceImageToStore.putFile(File(file.path));
                       // success: get download url
                       imageUrl= await referenceImageToStore.getDownloadURL();

                     }catch(error){}


                   }
                   else if(kIsWeb){
                     ImagePicker imagePicker=ImagePicker();
                     XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

                     debugPrint('${file?.path}');
                     if(file==null){
                       return;
                     }
                     String uniqueName= DateTime.now().microsecondsSinceEpoch.toString();
                     //get the reference to storage root
                     final referenceRoot= FirebaseStorage.instance.ref();
                     final referenceDirImg= referenceRoot.child('images');
                     //Create the reference to for the image to be stored
                     final referenceImageToStore=referenceDirImg.child(uniqueName);
                     //Handle error/success
                     try{
                       //Store file
                       await  referenceImageToStore.putData(
                         await file!.readAsBytes(),
                         SettableMetadata(contentType: 'image/jpeg'),)
                           .whenComplete(() async {
                         imageUrl= await referenceImageToStore.getDownloadURL();

                       })
                       ;
                       // success: get download url

                     }catch(error){}
                   }
                 },





                 icon: Icon(Icons.image),
                 label: Text('choose any image from gallery')
             ),
             SizedBox(height: 10,),

             ElevatedButton(onPressed: (){


               // if(imageUrl.isEmpty){
               //   ScaffoldMessenger.of(context)
               //       .showSnackBar(SnackBar(content: Text('please upload a image')));
               //   return;
               // }
               if(nameController.text.isEmpty){
                 ScaffoldMessenger.of(context)
                     .showSnackBar(SnackBar(content: Text('please enter name of college')));
                 return;
               }if(durationController.text.isEmpty){
                 ScaffoldMessenger.of(context)
                     .showSnackBar(SnackBar(content: Text('please duration of course')));
                 return;
               }if(feeController.text.isEmpty){
                 ScaffoldMessenger.of(context)
                     .showSnackBar(SnackBar(content: Text('please enter fees')));
                 return;
               }if(instituteController.text.isEmpty){
                 ScaffoldMessenger.of(context)
                     .showSnackBar(SnackBar(content: Text('please enter institute type')));
                 return;
               }if(placementController.text.isEmpty){
                 ScaffoldMessenger.of(context)
                     .showSnackBar(SnackBar(content: Text('please please enter placement')));
                 return;
               }
               String id= DateTime.now().millisecond.toString();
               firestore.doc(id).set({
                 'id':  id,
                 'name': nameController.text.toString(),
                 'duration': durationController.text.toString(),
                 'fees': feeController.text.toString(),
                 'institute': instituteController.text.toString(),
                 'placement': placementController.text.toString(),
                 'image' : imageUrl
               }).then((value) => Utils().toastMessage("Sucessfully sent to firebase")).onError((error, stackTrace) => Utils().toastMessage(error.toString()));
             }, child: Text('Send data to firebase')),
             SizedBox(height: 10,),
             TextButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> CollegeScreen()));
             }, child: Text('View Post'))

           ],
         ),
       ),
     ),
   );

  }

}