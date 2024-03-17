import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/component/form/form_error_message.dart';
import 'package:smart_order_app/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:smart_order_app/ui/component/typography/section_title.dart';

class ScenesCheckboxField extends StatelessWidget {
  final String description;
  final List<Scene> scenes;
  final Map<Id, bool> values;
  final void Function(Id, bool?) onChanged;
  final String? errorMessage;

  const ScenesCheckboxField({
    Key? key,
    this.description = "上記のフレーズを使いたい場面を選択して下さい。",
    required this.scenes,
    required this.values,
    required this.onChanged,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: "場面"),
        Text(description),
        const SizedBox(height: 12),
        ...scenes.map(
          (scene) {
            return SimpleCheckboxListTile(
              value: values[scene.id],
              onChanged: (bool? newValue) => onChanged(scene.id, newValue),
              title: scene.scene,
            );
          },
        ).toList(),
        FormErrorMessage(
          errorMessage: errorMessage,
        ),
      ],
    );
  }
}
