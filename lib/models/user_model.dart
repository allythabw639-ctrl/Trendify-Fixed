class UserModel {
  final String id;
  final String username;
  final String email;
  final String? avatarUrl;
  final String? bio;
  final int followers;
  final int following;
  final int likes;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
    this.bio,
    this.followers = 0,
    this.following = 0,
    this.likes = 0,
  });
}
