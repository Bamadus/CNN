class News{
   String? category;
   DateTime? datetime;
   String? headline;
   int? id;
   String? image;
  String? related;
   String? source;
    String? summary;
   String? url;
   bool isLiked = false;

  News({
     this.category,
     this.datetime,
     this.headline,
     this.id,
     this.image,
     this.related,
     this.source,
     this.summary,
     this.url,
    this.isLiked = false,
});
   News.fromJson(Map<String, dynamic> json){
    category= json['category'];
    // datetime= DateTime.fromMillisecondsSinceEpoch(json['datetime'] * 1000);
    int timestamp = json['datetime'] ?? 0;
    if (timestamp > 0) {
      datetime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    } else {
      print("⚠ Invalid datetime in JSON: ${json['datetime']}");
      datetime = DateTime.now(); // fallback
    }
    headline= json['headline'] ?? "No Headlines";
    id= json['id'] ?? 0;
    image= json['image']?.toString() ?? "";
    related= json['related']?.toString() ?? "";
    source= json['source']?.toString() ?? "Unknown Source";
    summary= json['summary']?.toString() ?? "No Summary";
    url= json['url']?.toString() ?? "No URL";
    isLiked = false;
  }
}


// DateTime.fromMillisecondsSinceEpoch(json['datetime'] * 1000)