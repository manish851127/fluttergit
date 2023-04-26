import 'package:flutter/material.dart';
class UploadImages extends StatefulWidget{
  const UploadImages({super.key});

  @override
  State<StatefulWidget> createState() {
return _UploadImages();
  }

}

class _UploadImages extends State<UploadImages>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title:  Text('Upload Images'),
     ),
     body: Column(
       children: [

       ],
     ),
   );
  }

}