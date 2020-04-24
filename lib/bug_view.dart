import 'dart:convert';

import 'package:flutter/material.dart';

class BugView extends StatelessWidget {
  const BugView({@required Key key})
      : assert(key != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final actionBarSize = Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.075,
    );
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.memory(
              base64.decode(
                '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',
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  child: GestureDetector(
                    key: Key('cancel_gesture_detector'),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: actionBarSize.height * 0.30,
                      ),
                    ),
                    onTap: () {
                      print('!');
                    },
                  ),
                  padding: EdgeInsets.all(23.0),
                ),
                Padding(
                  child: GestureDetector(
                    key: Key('done_gesture_detector'),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Color(0xFFFED80F),
                        fontSize: actionBarSize.height * 0.30,
                      ),
                    ),
                    onTap: () {
                      print('done');
                    },
                  ),
                  padding: EdgeInsets.all(24.0),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            width: actionBarSize.width,
            height: actionBarSize.height,
            color: Colors.blue,
          ),
        ],
      ),
      color: Colors.black,
    );
  }
}
