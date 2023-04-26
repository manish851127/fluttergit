import 'package:firebase_project/firestore1/collgege_category/reviews.dart';
import 'package:flutter/material.dart';

import 'courses_and_fees.dart';
import 'info_screen.dart';
class cardList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _cardList();
  }

}
class _cardList extends State<cardList>{
  final double coverHeight=230;
  final double profileHeight=124;
  int currentState=0;
  var arrItem=['Info','Courses & Fees','Reviews','Placement','Admission 2023','Cutoff','Gallery','Contact','Awards','Faculty','Brochure','Alumni'];
  List<Widget> tabList=[infoScreen(),coursesAndFess(),reviews()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            collapsedHeight: 268,
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            expandedHeight: 268.0,
            flexibleSpace: FlexibleSpaceBar(
              background: buildTop(),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    children: [
                      Expanded(flex: 6,child: Text('Indian Institute of Technology (IIT),Delhi',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)),
                      Expanded(flex: 2,child: ElevatedButton(onPressed: (){}, child: Text('Compare',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepOrange)),)),
                      SizedBox(width: 20,),
                      Expanded(flex: 1,child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrange),
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(5),right: Radius.circular(5))
                        ),
                        child: Icon(Icons.add),)
                      )

                    ],
                  ),
                ),
                // SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('kanpur, Utter Predesh',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 14),),
                ),
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month,color: Colors.deepOrange,size: 17,),),
                      Text('ESTD 1959',style: TextStyle(fontSize: 12,color:Colors.grey.shade800 ,fontWeight: FontWeight.bold),)
                    ],),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.account_balance,color: Colors.deepOrange,size: 17,),),
                      Text('Public College',style: TextStyle(fontSize: 12,color:Colors.grey.shade800 ,fontWeight: FontWeight.bold),)
                    ],),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.account_balance,color: Colors.deepOrange,size: 17,),),
                      Text('NIRF Ranking-5',style: TextStyle(fontSize: 12,color:Colors.grey.shade800 ,fontWeight: FontWeight.bold),)
                    ],),
                  ),
                  SizedBox(width: 10,)

                ],),
                Row(children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.check_box,color: Colors.deepOrange,size: 17,),),
                  Text('AICTE Approve',style: TextStyle(fontSize: 12,color:Colors.grey.shade800 ,fontWeight: FontWeight.bold),)
                ],),
                // SizedBox(width: 5,),

              ]),
              itemExtent: 37
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 50.0,
              maxHeight: 50.0,
              child:Container(
                height: 50,
                color: Colors.black87,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=> buildCard(index),
                  itemCount: arrItem.length,

                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return  tabList[currentState];
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildCard(index)=> InkWell(
    onTap: (){
      setState(() {
        currentState=index;
      });
      debugPrint(index);
    },

    child:   Container(
      color: currentState==index? Colors.green: Colors.transparent,
      child: Center(child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: Text(arrItem[index],style: TextStyle(fontSize: 16,color: Colors.white),
        ),
      ),
      ),

    ),
  );
  Widget buildTop() {
    final top=coverHeight-profileHeight/3;
    return Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children:[
          buildCoverImage(),
          Positioned(
              top: top,
              child: buildProfileImage()
          ),
          Positioned(
              top: 20,
              right: 10,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {  },
                child: Text('4.9/5',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

              )
          ),
          Positioned(
              top: 70,
              right: 13,
              child: Text('11 Ratings',style: TextStyle(fontSize: 17,color: Colors.white),)
          ),
          Positioned(
              bottom: 65,
              right: 10,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange.shade700),
                ),
                icon: Icon(Icons.ios_share_sharp),
                onPressed: (){}, label: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Text('Apply Now',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ),


              )),
          Positioned(
              bottom: 55,
              left: 10,
              child: Row(children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt,color: Colors.orangeAccent.shade200,)),
                    Text('8',style: TextStyle(fontSize: 15,color: Colors.white),)
                  ],
                ),
                SizedBox(width: 10,),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_fill,color: Colors.orangeAccent.shade200,)),
                    Text('2',style: TextStyle(fontSize: 15,color: Colors.white),)
                  ],
                ),
              ],)),


        ]
    );

  }
  Widget buildCoverImage()=> Container(
      color: Colors.grey,
      child: Image.asset('assets/images/iit_bom.jpeg',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.darken,
        color: Color(0xff181818).withOpacity(0.5),
      )

  );
  Widget buildProfileImage()=> CircleAvatar(
      radius: profileHeight/3,
      backgroundColor: Colors.grey.shade50,
      backgroundImage: AssetImage('assets/images/iit_delhi_logo.png'
      )
  );

}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}