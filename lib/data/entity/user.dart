class User{
  final String? profileUrl;
  final String? username;
  final String? displayName;

  User({
    this.profileUrl,
    this.username,
    this.displayName
});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      profileUrl: json['profile_url'] as String?,
      username: json['username'] as String?,
      displayName: json['display_name'] as String?,
    );
  }
}