import 'package:flutter/material.dart';
import 'package:local_auth_example/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primaryColor: Colors.indigo),
      home: Profile(),
    );
  }
}
