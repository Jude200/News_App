import 'package:flutter_flut/models/article.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteHelper {
  Database db;
  final String tName = 'WordNews';

  Future<void> open() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'news.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table WordNews ( 
          id integer primary key autoincrement, 
          source text not null,
          author text,
          title text  not null,
          description text  not null,
          url text  not null,
          urlToImage text  not null,
          publishedAt text  not null,
          content text  not null
          )
      ''');
    });
  }

  Future<Articles> insert(Articles article) async {
    await open();
    article.id = await db?.insert(tName, article.toMap());
    await close();
    print(article.title);
    return article;
  }

  Future<List<Articles>> getAllArticles() async {
    await open();
    List<Map<String, dynamic>> maps = await db?.query(tName);

    await close();
    // for (var item in maps) {
    //   item['source'] = {'id': null, 'source': 'judde'};
    //   print(item);
    // }
    print(maps.length);
    return maps.map((articleMap) => Articles.fromJsondb(articleMap)).toList();
  }

  Future<Articles> getArticle(String title) async {
    await open();
    List<Map<String, dynamic>> maps = await db.query(
      tName,
      where: 'title = ?',
      whereArgs: [title],
    );

    int l = maps?.length ?? 0;

    if (l > 0) {
      return Articles.fromJsondb(maps?.first);
    }
    return null;
  }

  Future<int> delete(String title) async {
    await open();
    int a = await db?.delete(tName, where: 'title = ?', whereArgs: [title]);
    await close();
    return a;
  }

  Future<void> close() async => db?.close();
}
