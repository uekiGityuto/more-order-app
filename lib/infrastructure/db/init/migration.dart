import 'package:sqflite/sqflite.dart';

const _migrationScripts = {
  1: [
    '''
      CREATE TABLE scenes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        scene TEXT NOT NULL UNIQUE,
        is_default INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        updated_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        CONSTRAINT check(is_default IN (0, 1))
      );
    ''',
    '''
      CREATE TABLE phrases (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        phrase TEXT NOT NULL UNIQUE,
        created_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        updated_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
      );
    ''',
    '''
      CREATE TABLE scenes_phrases (
        scene_id INTEGER,
        phrase_id INTEGER,
        PRIMARY KEY (scene_id, phrase_id),
        FOREIGN KEY (scene_id) REFERENCES scenes(scene_id) ON DELETE CASCADE,
        FOREIGN KEY (phrase_id) REFERENCES phrases(phrase_id) ON DELETE CASCADE
      );
    '''
    '''
      CREATE TABLE reasons (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        reason TEXT NOT NULL UNIQUE,
        is_default INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        updated_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        CONSTRAINT check(is_default IN (0, 1))
      );
    ''',
    '''
      INSERT INTO scenes(scene, is_default) VALUES('よく使うフレーズ', 1)
    ''',
  ],
};

void executeScript(Database db, int oldVersion, int newVersion) async {
  for (int i = oldVersion + 1; i <= newVersion; i++) {
    List<String>? queries = _migrationScripts[i];
    if (queries != null) {
      for (String query in queries) {
        await db.execute(query);
      }
    }
  }
}
