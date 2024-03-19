import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order_app/domain/repository/repository.dart';
import 'package:more_order_app/infrastructure/db/dao.dart';
import 'package:more_order_app/infrastructure/db/init/db.dart';
import 'package:more_order_app/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final db = await DB.open();
  runApp(
    ProviderScope(
        overrides: [repositoryProvider.overrideWithValue(DAO(db: db))],
        child: const App()),
  );
}
