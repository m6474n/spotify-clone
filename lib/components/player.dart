import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(height: 200,width: 200
        ,decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(500)),)
      
        ,
        Container(
          color: Colors.amber,
          child: Row(
            
            mainAxisSize: MainAxisSize.min,
            children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow)),
            IconButton(onPressed: (){}, icon: Icon(Icons.pause)),
            IconButton(onPressed: (){}, icon: Icon(Icons.stop)),
          ],),
        )
      
      ],),
    );
  }
}