import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';

Widget buildOptions(List<Phrase> phrases, WidgetRef ref) {
  return ListView.builder(
    itemCount: phrases.length,
    itemBuilder: (context, index) {
      final phrase = phrases[index];
      return Text(phrase.phrase);
    },
  );
}
