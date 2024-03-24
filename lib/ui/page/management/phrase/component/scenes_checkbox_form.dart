import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/scene.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/component/button/text_link_button.dart';
import 'package:more_order/ui/component/form/form_error_message.dart';
import 'package:more_order/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:more_order/ui/component/typography/section_title.dart';
import 'package:more_order/ui/page/management/scene/add/page.dart';

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
        const Align(
          alignment: Alignment.topRight,
          child: TextLinkButton(
            nextPage: SceneAddPage(),
            text: '場面を追加する',
          ),
        ),
      ],
    );
  }
}
