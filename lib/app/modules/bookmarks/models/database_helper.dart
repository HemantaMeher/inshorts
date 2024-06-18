import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'news_article.dart'; // Import the NewsArticle class

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _db;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDatabase();
    }
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'news_articles.db');

    // Create the database connection
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create tables and columns here
        await db.execute('''
          CREATE TABLE news_articles (
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            content TEXT NOT NULL,
            imageUrl TEXT,
            readMoreUrl TEXT
          )
        ''');
      },
    );
    return db;
  }

  // ... (methods for inserting, fetching, and deleting data)

  // Inserting data
  Future<int> insertArticle(NewsArticle article) async {
    final db = await this.db;
    final id = await db.insert('news_articles', article.toMap());
    return id;
  }

  // Fetching all data
  Future<List<NewsArticle>> getArticles() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('news_articles');
    return List.generate(maps.length, (i) => NewsArticle.fromMap(maps[i]));
  }
}
