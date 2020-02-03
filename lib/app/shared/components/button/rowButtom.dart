import 'package:flutter/material.dart';
import 'package:flutter_calculator/app/shared/components/button/button.dart';

class RowButton extends StatelessWidget {
  final List<Button> buttons;

  const RowButton({Key key, this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, b) {
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          return list;
        }),
      ),
    );
  }
}
