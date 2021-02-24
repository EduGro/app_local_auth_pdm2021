import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth_example/circular_action.dart';

import 'bloc/profile_bloc.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileBloc _bloc;
  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) {
          _bloc = ProfileBloc();
          return _bloc;
        },
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://www.nicepng.com/png/detail/413-4138963_unknown-person-unknown-person-png.png",
                  ),
                  minRadius: 40,
                  maxRadius: 80,
                ),
                SizedBox(height: 16),
                Text(
                  "Bienvenido",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: 8),
                Text("Usuario${UniqueKey()}"),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularAction(
                      textAction: "Ver tarjeta",
                      iconData: Icons.credit_card,
                      bgColor: Color(0xff123b5e),
                    ),
                    CircularAction(
                      textAction: "Cambiar foto",
                      iconData: Icons.camera_alt,
                      bgColor: Colors.orange,
                    ),
                    CircularAction(
                      textAction: "Ver tutorial",
                      iconData: Icons.play_arrow,
                      bgColor: Colors.green,
                    ),
                  ],
                ),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
