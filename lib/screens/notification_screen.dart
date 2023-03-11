import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No Notifications available yet',
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 18.0,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "When a new notification is found, they'll show up here",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
                fontFamily: 'Helvetica',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//create a main void for testing
void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
  ));
}