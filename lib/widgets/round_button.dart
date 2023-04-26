import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget{
  const RoundButton({super.key, required this.title, required this.onTab, this.loading=false});
  final String title;
  final VoidCallback onTab;
  final  bool loading;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,

      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10)
        ),
        child: loading? CircularProgressIndicator(value: 0,key: key,strokeWidth: 4.0 ,color: Colors.lightBlueAccent,) : Center(child: Text(title,style: TextStyle(color: Colors.white),),),
      ),
    );
  }

}