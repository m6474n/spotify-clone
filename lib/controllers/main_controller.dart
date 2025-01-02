import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:music_app/model/song_model.dart';
import 'package:music_app/services/db.dart';

class MainController extends GetxController {
  FilePickerResult? result;
  String selectedSong = "";
  AudioPlayer? player;
  PlayerState? playerState;
  Duration? duration;
  Duration? position;

  StreamSubscription? durationSubscription;
  StreamSubscription? positionSubscription;
  StreamSubscription? playerCompleteSubscription;
  StreamSubscription? playerStateChangeSubscription;
  DatabaseHelper db = DatabaseHelper.instance;


  late StreamController<List<Song>> songStreamController;
  late Stream<List<Song>> songStream;
  List<Song> songs = [];
  int currentIndex = 0;
  late Timer timer;
  
  loadSongs()async{
songs = await db.fetchSongs();
print(songs);
update();
  }

  pickMusicFile()async{
    // player = AudioPlayer();
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if(result!=null);
    String path = result!.files.first.path!;
  await   player!.setSourceDeviceFile(path);
    // Duration duration = await player!.load()??0;
    String title = result.files.first.name;

    Song song = Song(title: title, path: path );
    await db.insertSong(song);
  }

  initPlayer() {
    player = AudioPlayer();
    player!.setReleaseMode(ReleaseMode.stop);
    playerState = player!.state;

    player!.getDuration().then((value) {
      duration = value;
      update();
    });
    player!.getCurrentPosition().then((value) {
      position = value;
      update();
    });
 songStreamController = StreamController<List<Song>>.broadcast();
    songStream = songStreamController.stream;
    startPolling();  // Start polling the database for changes

  }
   void startPolling() {
    timer = Timer.periodic(Duration(seconds: 2), (_) async {
      List<Song> songs = await DatabaseHelper.instance.fetchSongs();
      if (songs.isEmpty || songs.length != songs.length) {
        songs = songs;
        songStreamController.add(songs); 
      }
    });
  }

  Future play(Song song) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player!.setSourceDeviceFile(song.path);
      await player!.resume();
    });
    playerState = PlayerState.playing;
    update();
  }

  Future stop() async {
    await player!.stop();
    playerState = PlayerState.stopped;
    position = Duration.zero;
    update();
  }

  Future pause() async {
    await player!.pause();
    playerState = PlayerState.paused;
    update();
  }

  pickFile() async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      print(result.toString());
    } else {
      print("No File Picked");
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    initPlayer();
    super.onInit();
  }
}
