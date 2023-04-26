import 'dart:async';
import 'package:flutter/material.dart';

class CardList1 extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList1> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 9) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
           Stack(children: [
             Container(
               height: 300,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 controller: _pageController,
                 itemCount: 10,
                 itemBuilder: (context, index) {
                   return Padding(
                     padding: EdgeInsets.symmetric(horizontal: 8.0),
                     child: GestureDetector(
                       onTap: () {
                         print('Card ${index + 1} pressed');
                       },
                       child: Container(
                         height:  50,
                         width: 400,
                         child: Card(
                           elevation: 6,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                             children: [
                               Expanded(
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.vertical(
                                       top: Radius.circular(10),
                                     ),
                                     image: DecorationImage(
                                       image: NetworkImage(
                                         "https://picsum.photos/id/${index + 1}/200/200",
                                       ),
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(
                                   "Card ${index + 1}",
                                   style: TextStyle(
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                   );
                 },
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 95),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   CircleAvatar(
                     radius: 20,
                     backgroundColor: Colors.white60,
                     child: IconButton(
                       iconSize: 30,
                       icon: Icon(Icons.arrow_left,),
                       onPressed: () {
                         _pageController.animateTo(
                           _pageController.offset - 300,
                           duration: Duration(milliseconds: 500),
                           curve: Curves.easeOut,
                         );
                       },
                     ),
                   ),
                   CircleAvatar(
                     radius: 20,
                     backgroundColor: Colors.white60,
                     child: IconButton(
                       iconSize: 30,
                       icon: Icon(Icons.arrow_right),
                       onPressed: () {
                         _pageController.animateTo(
                           _pageController.offset + 300,
                           duration: Duration(milliseconds: 500),
                           curve: Curves.easeOut,
                         );
                       },
                     ),
                   ),
                 ],
               ),
             ),
           ],),

        ],
      );
    ;
  }
}
