import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/constants.dart';
import 'package:smart_order_app/ui/page/order/select/page.dart';
import 'package:smart_order_app/ui/style/theme.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: const OrderSelectPage(sceneName: defaultScene),
      title: 'SmartOrderApp',
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
      // TODO: darkThemeはいらないかも
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: MaterialTheme.darkScheme().primaryContainer),
        colorScheme: ColorScheme.fromSeed(
          seedColor: MaterialTheme.darkScheme().primary,
          error: MaterialTheme.darkScheme().error,
          surface: MaterialTheme.darkScheme().surface,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: MaterialTheme.darkScheme().primary,
            textStyle: TextStyle(
              color: MaterialTheme.darkScheme().onPrimary,
              fontSize: 16 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: MaterialTheme.darkScheme().onPrimary,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: TextStyle(
              color: MaterialTheme.darkScheme().primary,
              fontSize: 16 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: MaterialTheme.darkScheme().primary,
            side: BorderSide(
              color: MaterialTheme.darkScheme().primary,
            ),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: MaterialTheme.darkScheme().surface,
          filled: true,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
