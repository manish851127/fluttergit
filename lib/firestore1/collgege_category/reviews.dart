import 'package:firebase_project/firestore1/collgege_category/card_list.dart';
import 'package:firebase_project/firestore1/collgege_category/card_list_1.dart';
import 'package:flutter/material.dart';
class reviews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _reviews();
  }

}
class _reviews extends State<reviews>{
   int currentIndex=0;
  final imageUrl= [
      'assets/images/iit2.jpeg',
      'assets/images/iit3.jpeg',

      
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Featured College',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
       SizedBox(height: 2),
       Container(width: 70, color: Colors.red,height: 3,margin: EdgeInsets.only(left: 8),),
       SizedBox(height: 15,),
        // Center(
        //   child: CarouselSlider.builder(
        //       itemCount: imageUrl.length,
        //     options: CarouselOptions(
        //         height: 400,
        //       // autoPlay: true,
        //       // animateToClosest: true,
        //       // viewportFraction: 1,
        //       autoPlayInterval: Duration(seconds: 5)
        //     ),
        //     itemBuilder: (context, index, realIndex) {
        //         final imageUrlIndex= imageUrl[index];
        //         return buildImage(imageUrlIndex,index);
        //     },
        //   ),
        // ),
        // Container(height: 100, width: double.infinity,
        // child: ListView.builder(
        //    scrollDirection: Axis.horizontal,
        //    itemCount: imageUrl.length,
        //     itemBuilder: (context,index){
        //       return Container(
        //         height: 100,
        //         width: 200,
        //         child: Card(
        //           child: Column(
        //             children: [
        //               Image.asset(imageUrl[index],height: 100,),
        //             ],
        //           ),
        //         ),
        //       );
        //     }
        // ),
        // ),
        SizedBox(height: 10),
        CardList1(),
        SizedBox(height: 10,),

        // SizedBox(height: 10),
        // TextButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> CardList1()));
        // }, child: Text('Click1')),


      ],
    );
  }

}