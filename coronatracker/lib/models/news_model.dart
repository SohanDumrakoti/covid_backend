class News {
  String? title;
  String? imageUrl;
  String? summary;

  News({this.title, this.imageUrl, this.summary});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'].toString(),
      imageUrl: json['image_url'].toString(),
      summary: json['summary'].toString(),
    );
  }
}
