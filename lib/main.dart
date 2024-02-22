import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/repository/repository.dart';
import 'package:smart_order_app/infrastructure/db/dao.dart';
import 'package:smart_order_app/infrastructure/db/init/db.dart';
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
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFDBE1FF)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2764EF)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
