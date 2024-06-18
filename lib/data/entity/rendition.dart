class Rendition{
  final String? url;
  final String? width;
  final String? height;

  Rendition({
    this.url,
    this.width,
    this.height,
});

  factory Rendition.fromJson(Map<String, dynamic> json){
    return Rendition(
      url: json['url'] as String?,
      width: json['width'] as String?,
      height: json['height'] as String?,
    );
  }
}