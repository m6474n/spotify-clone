import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/components/player.dart';
import 'package:music_app/controllers/main_controller.dart';

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Player(),
              // Text("${cont.result?.files.first.path}"),
              // ElevatedButton(onPressed: (){cont.pickFile();}, child: Text("Press"))
            ],),
          ),
        );
      }
    );
  }
}