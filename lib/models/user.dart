class User {
  String key;
  String userID;
  String email;
  String name;
  String userName;
  String displayName;
  String imageUrl;
  int followers;
  int following;
  List<String> followersList;
  List<String> followingList;

  User({
    required this.key,
    required this.userID,
    required this.email,
    required this.name,
    required this.userName,
    required this.displayName,
    required this.imageUrl,
    required this.followers,
    required this.following,
    required this.followersList,
    required this.followingList,
  });

  User.fromJson(Map<String, dynamic> map)
      : key = map['key'],
        userID = map['userID'],
        email = map['email'],
        name = map['name'],
        userName = map['userName'],
        displayName = map['displayName'],
        imageUrl = map['imageUrl'],
        followers = map['followers'],
        following = map['following'],
        followersList = List<String>.from(map['followersList']),
        followingList = List<String>.from(map['followingList']);

  Map<String, dynamic> toJson() => {
        'key': key,
        'userID': userID,
        'email': email,
        'name': name,
        'userName': userName,
        'displayName': displayName,
        'imageUrl': imageUrl,
        'followers': followers,
        'following': following,
        'followersList': followersList,
        'followingList': followingList,
      };
}
