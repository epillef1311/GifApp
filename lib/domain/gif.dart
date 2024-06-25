class Gif{
  final String id;
  final String title;
  final String previewUrl;
  final String url;
  final String? displayName;
  final String? username;
  final String? userProfileUrl;
  final String? height;
  final String? width;

  Gif({
    required this.id,
    required this.title,
    required this.previewUrl,
    required this.url,
    this.displayName,
    this.username,
    this.userProfileUrl,
    this.height,
    this.width,
});
}