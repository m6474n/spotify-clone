import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:music_app/components/player.dart';
import 'package:music_app/controllers/main_controller.dart';
import 'package:music_app/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: MainController(),
        builder: (cont) {
          return Scaffold(
            appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01,
                      color: colorManager.iconColor),
                ),
                actions: [
                  HugeIcon(
                      icon: HugeIcons.strokeRoundedMoreVertical,
                      color: colorManager.iconColor),
                  SizedBox(
                    width: 12,
                  )
                ],
                title: Center(child: Image.asset('assets/imgs/logo.png'))),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                children: [
                  
                
                                Positioned(
                                  top: 50,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                  width:width,
                                  padding: EdgeInsets.all(18),
                                  height: 135,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(24)),
                                    color: colorManager.primaryColor),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                         
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          Text("New Album", style: TextStyle(color: colorManager.whiteColor, fontWeight: FontWeight.bold, fontSize: 12, height: 1),),
                                          Text("Happier Than \nEver", style: TextStyle(color: colorManager.whiteColor, fontWeight: FontWeight.bold, height :1.2,fontSize: 24),),
                                            Text("Billie Eilish", style: TextStyle(color: colorManager.whiteColor, fontWeight: FontWeight.bold),),
                                        ],),
                                      ),
                                      Expanded(child: Container(decoration: BoxDecoration(image:DecorationImage(image: AssetImage('assets/imgs/Union.png'),fit: BoxFit.cover),),),)
                                    ],
                                  ),
                                 ) ),
                                     Positioned(
                                top: -20,
                                right: 0,
                                child: Image.asset("assets/imgs/billie.png",scale: 0.9,)),
                                Positioned(
                                  top: 200,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                  height: 60,
                                  width:width,
                                  // color: Colors.red,
                                  child: ListView.builder(
                                    
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cont.catList.length,
                                    itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right:34.0),
                                      child: Text('${cont.catList[index]}',style: TextStyle(
                                        fontSize: 20,
                                        color: colorManager.textColor, fontWeight: index == 0 ? FontWeight.bold : null),),
                                    );
                                  }),
                                  )),
                                   Positioned(
                                  top: 250,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                 height: 200,
                                  // color: Colors.cyanAccent,
                                  width:width,
                                  child:
                                   ListView.builder(
                                    
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cont.catList.length,
                                    itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right:12.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            width: 160,
                                            decoration: BoxDecoration(color: colorManager.grayColor, 
                                              image: DecorationImage(image: AssetImage('assets/imgs/rec-1.png'),fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(24)),),
                                            Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: Container(height: 40,width: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                            
                                              color: colorManager.grayColor,border: Border.all(color: colorManager.iconColor, ),),child: HugeIcon(icon: HugeIcons.strokeRoundedPlay, color: colorManager.iconColor),))
                                        ],
                                      )
                                    );
                                  }) ,))

                  // Player(),
                  // Text("${cont.result?.files.first.path}"),
                  // ElevatedButton(onPressed: (){cont.pickMusicFile();}, child: Text("Press")),
                  // ElevatedButton(onPressed: (){cont.loadSongs();}, child: Text("load")),
                 
                ],
              ),
            ),
          );
        });
  }
}



//  Expanded(
//                       child: ListView.builder(
//                           itemCount: cont.songs.length,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               leading: Container(
//                                 decoration: BoxDecoration(
//                                     color: colorManager.grayColor,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 height: 50,
//                                 width: 50,
//                                 child: Center(
//                                   child: HugeIcon(
//                                       icon: HugeIcons.strokeRoundedPlay,
//                                       color: colorManager.iconColor),
//                                 ),
//                               ),
//                               title: Container(
//                                 constraints: BoxConstraints(maxWidth: 150),
//                                 child: Text(
//                                   cont.songs[index].title,
//                                   overflow: TextOverflow.ellipsis,
//                                   style:
//                                       TextStyle(color: colorManager.whiteColor),
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 "Artist",
//                                 style: TextStyle(color: colorManager.textColor),
//                               ),
//                               trailing: HugeIcon(
//                                   icon: HugeIcons.strokeRoundedFavourite,
//                                   color: colorManager.iconColor),
//                             );
//                           })),