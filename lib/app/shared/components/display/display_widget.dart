import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String text;

  const DisplayWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                text,
                maxFontSize: 80,
                minFontSize: 20,
                textAlign: TextAlign.end,
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 80,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}