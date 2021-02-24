import 'package:flutter/material.dart';

class CircularAction extends StatelessWidget {
  final IconData iconData;
  final Color bgColor;
  final String textAction;
  final Function action;
  const CircularAction({
    Key key,
    this.iconData = Icons.smartphone,
    this.bgColor = Colors.indigo,
    this.textAction,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CircleAvatar(
            child: Icon(iconData, color: Colors.grey[100]),
            backgroundColor: bgColor,
            radius: 36,
          ),
          onTap: action,
        ),
        SizedBox(height: 16),
        Text("${textAction ?? "No action"}"),
      ],
    );
  }
}
