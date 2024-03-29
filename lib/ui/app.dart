import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/constants.dart';
import 'package:more_order/ui/page/order/select/page.dart';
import 'package:more_order/ui/style/theme.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: const OrderSelectPage(sceneName: defaultScene),
      title: 'More Order',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: MaterialTheme.lightScheme().primaryContainer),
        colorScheme: ColorScheme.fromSeed(
          seedColor: MaterialTheme.lightScheme().primary,
          error: MaterialTheme.lightScheme().error,
          surface: MaterialTheme.lightScheme().surface,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: MaterialTheme.lightScheme().primary,
            textStyle: TextStyle(
              color: MaterialTheme.lightScheme().onPrimary,
              fontSize: 16 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: MaterialTheme.lightScheme().onPrimary,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: TextStyle(
              color: MaterialTheme.lightScheme().primary,
              fontSize: 16 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: MaterialTheme.lightScheme().primary,
            side: BorderSide(
              color: MaterialTheme.lightScheme().primary,
            ),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: MaterialTheme.lightScheme().surface,
          filled: true,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
