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
    return  GetBuilder(
      init: MainController(),
      builder: (cont) {
        return Scaffold(
          appBar: AppBar(
            leading: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: colorManager.iconColor),
            actions: [HugeIcon(icon: HugeIcons.strokeRoundedMoreVertical, color: colorManager.iconColor), SizedBox(width: 12,)],
            title: Center(child: Image.asset('assets/imgs/logo.png'))),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                // Player(),
              // Text("${cont.result?.files.first.path}"),
              // ElevatedButton(onPressed: (){cont.pickMusicFile();}, child: Text("Press")),
              ElevatedButton(onPressed: (){cont.loadSongs();}, child: Text("load")),
                Expanded(child: ListView.builder(
                  itemCount: cont.songs.length,
                  itemBuilder: (context,index){
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(color: colorManager.grayColor, borderRadius: BorderRadius.circular(50)),
                      height: 50,
                      width: 50,
                      child: Center(child: HugeIcon(icon: HugeIcons.strokeRoundedPlay, color: colorManager.iconColor),),),
                    title: Container(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: Text(cont.songs[index].title, overflow: TextOverflow.ellipsis,style: TextStyle(color: colorManager.whiteColor),),),
                    subtitle: Text("Artist", style: TextStyle(color: colorManager.textColor),),
                    trailing: HugeIcon(icon: HugeIcons.strokeRoundedFavourite, color: colorManager.iconColor),
                    );
                })),
            ],),
          ),
        );
      }
    );
  }
}