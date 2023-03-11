// All menu items are clickable
// You can use any network image as a placeholder
// the username and follower count for now is just a place holder but will be fetched with our backend later
// Please note that not all feature added to the menu will be developed some of them are just placeholders

import 'package:flutter/material.dart';
import '../widgets/side_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
      ),
      drawer:  SideBarMenu(),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

void main() {
  runApp( const MaterialApp(
    home: Scaffold(
      body: Center(
        child: HomeScreen(),
      ),
    ),
  ));
}