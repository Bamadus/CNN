class News{
  final String category;
  final DateTime datetime;
  final String headlines;
  final int id;
  final String image;
  final String related;
  final String source;
  final String summary;
  final String url;

  News({
    required this.category,
    required this.datetime,
    required this.headlines,
    required this.id,
    required this.image,
    required this.related,
    required this.source,
    required this.summary,
    required this.url,
});
  factory News.fromJson(Map<String, dynamic> json){
    return News(
      category: json['category'],
      datetime: json['datetime'] != null ? DateTime.parse(json['datetime']) : DateTime.now(),
      headlines: json['headlines'] ?? "No Headlines",
      id: json['id'] ?? "No ID",
      image: json['image']?.toString() ?? "",
      related: json['related']?.toString() ?? "",
      source: json['source']?.toString() ?? "Unknown Source",
      summary: json['summary']?.toString() ?? "No Summary",
      url: json['url']?.toString() ?? "No URL",
    );
  }
}


// DateTime.fromMillisecondsSinceEpoch(json['datetime'] * 1000)