import 'package:flutter/material.dart';
import 'package:flutter_calculator/app/shared/components/button/button.dart';
import 'package:flutter_calculator/app/shared/components/button/rowButtom.dart';

class KeyboardWidget extends StatelessWidget {
  final void Function(String) cb;

  const KeyboardWidget({this.cb});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          RowButton(
            buttons: [
              Button.big(text: 'AC', cb: cb, color: Button.DARK),
              Button(text: '%', cb: cb, color: Button.DARK),
              Button.operation(text: '/', cb: cb),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          RowButton(
            buttons: [
              Button(text: '7', cb: cb),
              Button(text: '8', cb: cb),
              Button(text: '9', cb: cb),
              Button.operation(text: 'x', cb: cb),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          RowButton(
            buttons: [
              Button(text: '4', cb: cb),
              Button(text: '5', cb: cb),
              Button(text: '6', cb: cb),
              Button.operation(text: '-', cb: cb),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          RowButton(
            buttons: [
              Button(text: '1', cb: cb),
              Button(text: '2', cb: cb),
              Button(text: '3', cb: cb),
              Button.operation(text: '+', cb: cb),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          RowButton(
            buttons: [
              Button.big(text: '0', cb: cb),
              Button(text: '.', cb: cb),
              Button.operation(text: '=', cb: cb),
            ],
          ),
        ],
      ),
    );
  }
}
