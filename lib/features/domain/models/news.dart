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
});
   News.fromJson(Map<String, dynamic> json){
    category= json['category'];
    datetime= DateTime.fromMillisecondsSinceEpoch((json['datetime']?? 0) * 1000);
    headline= json['headline'] ?? "No Headlines";
    id= json['id'] ?? 0;
    print('=================');
    image= json['image']?.toString() ?? "";
    related= json['related']?.toString() ?? "";
    source= json['source']?.toString() ?? "Unknown Source";
    summary= json['summary']?.toString() ?? "No Summary";
    url= json['url']?.toString() ?? "No URL";
  }
}


// DateTime.fromMillisecondsSinceEpoch(json['datetime'] * 1000)