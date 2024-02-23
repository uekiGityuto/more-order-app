import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';

class OrderDisplay extends StatelessWidget {
  final String sceneName;
  final List<Phrase> phrases;
  const OrderDisplay({Key? key, required this.sceneName, required this.phrases})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: sceneName),
      body: DefaultLayout(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: phrases.length,
                itemBuilder: (context, index) {
                  final scene = phrases[index];
                  return ListTile(
                    leading: const Icon(Icons.fiber_manual_record),
                    title: Text(scene.phrase),
                    contentPadding: EdgeInsets.zero,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("お願いします"),
          ],
        ),
      ),
    );
  }
}
