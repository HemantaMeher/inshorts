class NewsArticle {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String readMoreUrl;

  NewsArticle({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.readMoreUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'readMoreUrl': readMoreUrl,
    };
  }

  factory NewsArticle.fromMap(Map<String, dynamic> map) {
    return NewsArticle(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      readMoreUrl: map['readMoreUrl'] as String,
    );
  }
}
