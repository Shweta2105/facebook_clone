import 'package:facebookui/data/data.dart';
import 'package:facebookui/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebookui/config/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Text(
                'facebook',
                style: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2),
              ),
              floating: true,
              actions: [
                CircleButton(
                    icon: Icons.search,
                    iconSize: 30.0,
                    onPressed: () => print("Search")),
                CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30.0,
                    onPressed: () => print("Messanger"))
              ]),
          SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)
              // Container(height: 100, color: Colors.red),
              ),

          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
                child: Stories(
              currentUser: currentUser,
              stories: stories,
            )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            }, childCount: posts.length),
          )
          //3
        ],
      ),
    );
  }
}
