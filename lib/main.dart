import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/repository/repository.dart';
import 'package:smart_order_app/infrastructure/db/dao.dart';
import 'package:smart_order_app/infrastructure/db/init/db.dart';
import 'package:smart_order_app/theme.dart';
import 'package:smart_order_app/ui/page/home.dart';

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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      title: 'SmartOrderApp',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: MaterialTheme.lightScheme().primaryContainer),
        colorScheme: ColorScheme.fromSeed(
          seedColor: MaterialTheme.lightScheme().primary,
          error: MaterialTheme.lightScheme().error,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: MaterialTheme.darkScheme().primaryContainer),
        colorScheme: ColorScheme.fromSeed(
          seedColor: MaterialTheme.darkScheme().primary,
          error: MaterialTheme.darkScheme().error,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
