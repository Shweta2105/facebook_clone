import 'package:facebookui/config/palette.dart';
import 'package:facebookui/data/data.dart';
import 'package:facebookui/widget/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class Rooms extends StatefulWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});
  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ));
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: ButtonStyle(
        textStyle:
            MaterialStateProperty.all(TextStyle(color: Palette.facebookBlue)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(
              width: 3.0,
              color: Color.fromRGBO(130, 177, 255, 1),
            ),
          ),
        ),
      ),
      child: Row(children: [
        ShaderMask(
          shaderCallback: (rect) =>
              Palette.createRoomGradient.createShader(rect),
          child: Icon(
            Icons.video_call,
            size: 35,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text("Create\nRoom")
      ]),
    );
  }
}
