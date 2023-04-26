import 'package:flutter/material.dart';
// import 'package:readmore/readmore.dart';
class infoScreen extends StatefulWidget{
  const infoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
   return _infoScreen();
  }
}

class _infoScreen extends State<infoScreen>{
  String content=
      'The Indian Institute of Technology Madras (IIT Madras) is an engineering and technology school in Chennai (formerly Madras) in southern India. Recognized as an Institute of National Importance by the Government of India, it is regarded as one of the finest engineering institutions in India. Founded in 1959 with technical and financial assistance from the German Government, IIT Madras is third among currently sixteen Indian Institutes of Technology (including 6 new IITs started in 2008 and 2 more in 2009) established by the Government of India through an Act of Parliament, to provide education and research facilities in engineering and technology.';
 bool isVisible= false;
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
         Card(
           margin: EdgeInsets.all(8),
           elevation: 5,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                  Text(content,textAlign: TextAlign.justify,),
                  SizedBox(height: isVisible?15:0,),
                 Visibility(
                   visible: isVisible,
                   child: Column(
                     children: [
                       Text(
                           'Spread across 2.5 sq. km (630 acres) IIT Madras campus which was formerly a part of the Guindy National Park, The campus has a protected forest being home to many wildlife animals such as chital, black buck etc. The institute has nearly 550 faculties, 8,000 students and 1,250 administrative and supporting staff, administered by IIT council an apex body formed to keep an eye into the working of all the IITs present in the country.',textAlign: TextAlign.justify,
                       ),
                       SizedBox(height: 15,),
                       Text(

                           'There are various undergraduate and postgraduate courses offered by IIT Madras such as B.Tech, M.Tech. M.Sc, M.A, and PhD. Admissions at IIT Madras for courses like B.Tech is on the basis of JEE Advanced, the M.Tech course is on the basis of GATE, M.Sc course is on the basis of IIT-JAM, M.A course is on the basis of HSEE, Pd.D course on the basis of GATE, CSIR-NET or UGC-NET.',textAlign: TextAlign.justify,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 15),
                         child: Center(child: Table(
                           border: TableBorder.all(color: Colors.blueGrey),
                           columnWidths: {
                             0: FractionColumnWidth(0.5),
                             1: FractionColumnWidth(0.25),
                             2: FractionColumnWidth(0.25)
                           },
                           children: [
                             buildRow(['Body/Magazine','Year','Rank'],isHeader: true),
                             buildRow(['NIRF (Overall)','2018','2']),
                             buildRow(['NIRF (Engineering)','2018','1']),
                             buildRow(['The Week (Engineering)','2017','4']),
                             buildRow(['QS (World)','2018','264']),
                             buildRow(['QS (BRICS)','2018','18']),

                           ],
                         ),),
                       ),
                       SizedBox(height: 10,),
                     ],
                   ),
                 ),
                 TextButton(onPressed: (){
                   setState(() {
                     isVisible=!isVisible;
                   });
                 }, child: Center(child: Text(isVisible?'Less':'More'))),

               ],
             ),
           )
         ),
         Card(
           margin: EdgeInsets.all(8),
           elevation: 5,
           child: Column(
             children: [
               SizedBox(height: 15,),
               Text("Apply Online",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
               SizedBox(height: 15,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Text("This college accepts application fees online. Clicking on the button below redirects to college website.",style: TextStyle(fontSize: 15)),
               ),
               SizedBox(height: 15,),
               ElevatedButton.icon(style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.deepOrange)
               ),onPressed: (){}, icon: Icon(Icons.screen_share,size: 16,), label: Text('Apply Now',style: TextStyle(fontSize: 16),), ),
               SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Expanded(child: Column(
                   children: [
                     Icon(Icons.timer_sharp),
                     SizedBox(height: 10,),
                     Text('12 Minutes',style: TextStyle(fontSize: 16),),
                     SizedBox(height: 30,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 5),
                       child: Text('Estimated time required to complete all application fields and make payment.',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                     ),
                   ],
                 )),
                 Expanded(child: Column(
                   children: [
                     Icon(Icons.currency_rupee),
                     SizedBox(height: 10,),
                     Text('650/-',style: TextStyle(fontSize: 16),),
                     SizedBox(height: 30,),
                     Text('Application fees to be paid.',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                   ],
                 )),
                 Expanded(child: Column(
                   children: [
                     Icon(Icons.insights_sharp),
                     SizedBox(height: 10,),
                     Text('Instant Confirmation',style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                     SizedBox(height: 10,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 5),
                       child: Text('Confirmation will be sent to the email address and phone number you enter',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                     ),
                   ],
                 )),
               ],),
               SizedBox(height: 15,)
             ],
           ),

         ),


     ],
   );
  }

 TableRow buildRow(List<String> cells,{bool isHeader=false}) {
    return TableRow(
      children: cells.map((cell) => Container(
        color: isHeader? Colors.green: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(
            cell,
            style: TextStyle(
              color: isHeader? Colors.white: Colors.black87,
              fontWeight: isHeader? FontWeight.bold: FontWeight.normal
            ),
          )),
        ),
      )).toList()
 );
 }

}