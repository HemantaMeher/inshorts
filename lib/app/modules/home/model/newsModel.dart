class NewsModel {
  NewsModel({
    required this.category,
    required this.data,
    required this.success,
  });

  final String? category;
  final List<Datum> data;
  final bool? success;

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      category: json["category"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      success: json["success"],
    );
  }

}

class Datum {
  Datum({
    required this.author,
    required this.content,
    required this.date,
    required this.id,
    required this.imageUrl,
    required this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  final String? author;
  final String? content;
  final String? date;
  final String? id;
  final String? imageUrl;
  final String? readMoreUrl;
  final String? time;
  final String? title;
  final String? url;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      author: json["author"],
      content: json["content"],
      date: json["date"],
      id: json["id"],
      imageUrl: json["imageUrl"],
      readMoreUrl: json["readMoreUrl"],
      time: json["time"],
      title: json["title"],
      url: json["url"],
    );
  }

}
