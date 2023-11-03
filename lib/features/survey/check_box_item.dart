import 'package:coaching_app/features/user/domain/user.dart';
import 'package:flutter/material.dart';

class CheckboxListItem extends StatefulWidget {
  const CheckboxListItem({super.key, required User user});

  @override
  State<CheckboxListItem> createState() => _CheckboxListItemState();
}

class _CheckboxListItemState extends State<CheckboxListItem> {
  bool checkboxValue1 = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckboxListTile(
          value: checkboxValue1,
          onChanged: (bool? value) {
            setState(() {
              checkboxValue1 = value!;
            });
          },
          title: const Text('Headline'),
          subtitle: const Text('Supporting text'),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
