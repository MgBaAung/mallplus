import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelButtonName;
  final String yesButtonName;
  final VoidCallback onPressed;
  final VoidCallback cancelOnPressed;

  MyDialog({
    required this.title,
    required this.content,
    required this.cancelButtonName,
    required this.yesButtonName,
    required this.onPressed,
    required this.cancelOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text("$title"),
      content: Text(
        '$content',
        style: TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: cancelOnPressed,
                child: Text(
                  "$cancelButtonName",
                  style: TextStyle(fontSize: 16, color: Colors.black45),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: MaterialButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: onPressed,
                child: Text(
                  "$yesButtonName",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
