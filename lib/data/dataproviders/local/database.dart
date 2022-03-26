import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName(
    'Article') // It is the default name instead of 'Articles', but I put it here if we want to change
class Articles extends Table {
  // Will not accept the data that is not comply with this terms & throw an Exception which you can handle later
  TextColumn get title => text().customConstraint("UNIQUE")();

  TextColumn get author => text().nullable()();

  TextColumn get description => text().withLength(min: 1, max: 350)();

  TextColumn get urlImage => text().withLength(min: 1, max: 350)();

  @override
  Set<Column> get primaryKey => {title};
}

@DriftDatabase(tables: [Articles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // We should bump this number on each update
  @override
  int get schemaVersion => 1;

  Future<List<Article>> getAllArticles() => select(articles).get();

  Stream<List<Article>> watchAllArticles() => select(articles).watch();

  Future<int> insertArticle(Article article) => into(articles).insert(article, onConflict: DoUpdate((_) => article, target: [articles.title]));

  Future<bool> updateArticle(Article article) =>
      update(articles).replace(article);

  Future<int> deleteArticle(Article article) =>
      delete(articles).delete(article);

  Future<int> deleteAllArticles() => delete(articles).go();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}
