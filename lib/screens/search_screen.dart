import 'package:flutter/material.dart';
import 'package:twitter/BSData/bsusers.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class SearchScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = BSUserData().users;

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UsersSearchResultsWidget(

          username: users[index]['username'],
          name: users[index]['name'],
          imgUrl: users[index]['imgUrl'],
        );
      },
      //   )
      // ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: SearchScreen(),
    ),
  );
}