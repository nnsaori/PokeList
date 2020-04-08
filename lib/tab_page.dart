import 'package:flutter/material.dart';
import 'package:pokes/monster_ball_page.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(tabs: [
          Tab(icon: Icon(Icons.directions_bike)),
          Tab(icon: Icon(Icons.folder_special)),
          ]);
    
    return DefaultTabController(length: 2, 
    child: Scaffold(
      appBar: AppBar(bottom: 
        tabBar,
      ),
      body: TabBarView(children: [
        MonsterBallPage(),
        Icon(Icons.directions_bike),
      ])
      
    ),
    );
  }

}