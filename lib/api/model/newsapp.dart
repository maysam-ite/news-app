class NewsApp {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
 // Map<String,String> l;
  NewsApp(
      {required this.author,
      required this.content,
      required this.title,
      required this.description,
      required this.publishedAt,
      required this.url,
      required this.urlToImage,
     // required this.l
      });
  factory NewsApp.map(Map<String, dynamic> m) {
    return NewsApp(
     // l: m["source"]??'null',
      author: m['author'] ?? 'null',
      title: m['title'] ?? 'null',
      description: m['description'] ?? 'null',
      url: m['url'] ?? 'null',
      urlToImage: m['urlToImage'] ?? 'null',
      content: m['content'] ?? 'null',
      publishedAt: m['publishedAt'] ?? 'null',
    );
  }
}
