import 'package:flutter/material.dart';
class coursesAndFess extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _coursesAndFess();
  }

}
class _coursesAndFess extends State<coursesAndFess>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(10),
          child: Padding(padding: EdgeInsets.all(8),
            child: Table(
              border: TableBorder.all(color: Colors.black54),
              columnWidths: {
                0: FractionColumnWidth(0.5),
                1: FractionColumnWidth(0.25),
                2: FractionColumnWidth(0.25),
              },
              children: [
                buildRow(['Courses','Duration','Total fees'], isHeader: true),
                buildRow(['Batchler of Technology(B.Tech)','5 Years	','9,00,450']),
                buildRow(['Dual Degree- B.Tech, M.Tech','5 years','9,45,00']),
                buildRow(['Master of Business Administration(MBA)','2 Years',' 7,15,750']),
                buildRow(['Master of Technology(M.Tech)',' 2 years','60,000']),
                buildRow(['Doctor of Philosphy','5 years','1,19,500'])
              ],
            ),
          ),
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

 TableRow buildRow(List<String>cells,{bool isHeader=false}) {
    return TableRow(
      children: cells.map((cell)=> Container(
        color: isHeader? Colors.green: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(8),
          child:Center(
            child: Text(
              cell,
              style: TextStyle(
                fontSize: 13,
                 color: isHeader? Colors.white: Colors.black,
                fontWeight: isHeader? FontWeight.bold: FontWeight.normal
              ),
            ),
          ),
        ),
      )).toList()
    );
 }

}