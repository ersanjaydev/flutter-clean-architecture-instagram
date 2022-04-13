import 'package:cloud_firestore/cloud_firestore.dart';

class UserPersonalInfo {
  String bio;
  String email;
  String name;
  String profileImageUrl;
  String userName;
  String userId;
  List<dynamic> followedPeople;
  List<dynamic> followerPeople;
  List<dynamic> posts;

  UserPersonalInfo(
      {required this.followedPeople,
      required this.followerPeople,
      required this.posts,
      this.name = "",
      this.bio = "",
      this.email = "",
      this.profileImageUrl = "",
      this.userName = "",
      this.userId = ""});

  static UserPersonalInfo fromSnap(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    return UserPersonalInfo(
      name: snap["name"],
      userId: snap["uid"],
      profileImageUrl: snap["profileImageUrl"],
      email: snap["email"],
      bio: snap["bio"],
      userName: snap["userName"],
      posts: snap['posts'],
      followedPeople: snap['following'],
      followerPeople: snap['followers'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'following': followedPeople,
      'followers': followerPeople,
      'posts': posts,
      'name': name,
      'userName': userName,
      'bio': bio,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'uid': userId,
    };
  }
}