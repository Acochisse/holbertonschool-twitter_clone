import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TwitterPostWidget extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String username;
  final String text;
  final DateTime timestamp;

  TwitterPostWidget({
    Key? key,
    required this.profileImageUrl,
    required this.name,
    required this.username,
    required this.text,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  Text(
                    '@$username - ${_getTimeDifference()} ago',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Helvetica Neue',
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getFormattedTimestamp(),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  fontFamily: 'Helvetica Neue',
                ),
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.grey[600],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getTimeDifference() {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inDays >= 1) {
      return '${difference.inDays}d';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }

  String _getFormattedTimestamp() {
    final formatter = DateFormat('h:mm a - d MMM y');
    return formatter.format(timestamp);
  }
}

// create a test main void
void main() {
  runApp(
    MaterialApp(
      home: TwitterPostWidget(
        profileImageUrl:
            'https://pbs.twimg.com/profile_images/1498611576416395271/x3t_5pdo_400x400.jpg',
        name: 'Flutter',
        username: 'flutter',
        text: 'I love flutter, but flutter is cool.',
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      ),
    ),
  );
}
