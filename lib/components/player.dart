import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:music_app/main.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: colorManager.iconColor),),)
;  }
}