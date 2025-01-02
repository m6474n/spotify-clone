import 'package:music_app/model/song_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('musicPlayer.db');
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Create the songs table (now with duration)
  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE songs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      path TEXT,
      artist TEXT,
      duration INTEGER
    );
    ''');
  }

  // Insert a new song
  Future<int> insertSong(Song song) async {
    final db = await instance.database;
    return await db.insert('songs', song.toMap());
  }

  // Fetch all songs
  Future<List<Song>> fetchSongs() async {
    final db = await instance.database;
    final maps = await db.query('songs');
    return List.generate(maps.length, (i) {
      return Song.fromMap(maps[i]);
    });
  }

  // Delete a song by id
  Future<int> deleteSong(int id) async {
    final db = await instance.database;
    return await db.delete('songs', where: 'id = ?', whereArgs: [id]);
  }
}
