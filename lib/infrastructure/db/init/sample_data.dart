import 'package:sqflite/sqflite.dart';

const _sampleDataScripts = [
  '''
    INSERT INTO scenes(scene) VALUES('コンビニ');
  ''',
  '''
    INSERT INTO scenes(scene) VALUES('レストラン');
  ''',
  '''
    INSERT INTO phrases(phrase) VALUES('ホットのカフェラテM');
  ''',
  '''
    INSERT INTO scenes_phrases(scene_id, phrase_id) VALUES(1, 1);
  ''',
  '''
    INSERT INTO scenes_phrases(scene_id, phrase_id) VALUES(2, 1);
  ''',
  '''
    INSERT INTO phrases(phrase) VALUES('ファミチキ');
  ''',
  '''
    INSERT INTO scenes_phrases(scene_id, phrase_id) VALUES(1, 2);
  ''',
  '''
    INSERT INTO scenes_phrases(scene_id, phrase_id) VALUES(2, 2);
  ''',
  '''
    INSERT INTO phrases(phrase) VALUES('水');
  ''',
  '''
    INSERT INTO scenes_phrases(scene_id, phrase_id) VALUES(3, 3);
  ''',
  '''
    INSERT INTO phrases(phrase) VALUES('お会計');
  ''',
  '''
    INSERT INTO scenes_phrases(scene_id, phrase_id) VALUES(1, 4);
  ''',
  '''
    INSERT INTO scenes_phrases(scene_id, phrase_id) VALUES(3, 4);
  ''',
  '''
    INSERT INTO reasons(reason, is_default) VALUES('喉が痛いのでこちらで注文します', 1);
  ''',
  '''
    INSERT INTO payment_methods(method, is_default) VALUES('PayPay', 1);
  ''',
  '''
    INSERT INTO payment_methods(method) VALUES('現金');
  ''',
];

Future<void> executeSampleScript(Database db) async {
  List<String>? queries = _sampleDataScripts;
  for (String query in queries) {
    await db.execute(query);
  }
}
