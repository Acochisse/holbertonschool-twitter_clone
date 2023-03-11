// create a new stateless widget UsersSearchResultsWidget with these attributes : * name : String * username : String * imgUrl : String
import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String name;
  final String username;
  final String imgUrl;

  const UsersSearchResultsWidget({
    Key? key,
    required this.name,
    required this.username,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container needs to have a background color of white and a grey divider between each returned user. do not use ListTile. user text style will be color grey[600] and username will be color grey[900] font size should be 16.
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.grey[900], fontSize: 14, fontFamily: 'Helvetica Neue'),
                    
                  ),
                  Text(
                    username,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12, fontFamily: 'Helvetica Neue'),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
      
