import 'package:flutter/material.dart';
import 'package:cnn/features/domain/models/news.dart';
import 'package:cnn/features/data/services/api_services.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int thumn_counter = 0;
  bool is_liked = false;
  final clickKey= GlobalKey();
  List<IconData> like = [];
  final IconData Unselected_like = Icons.thumb_up_alt_outlined;
  final IconData active_like = Icons.thumb_up;

  //  IconData toggleLike(IconData button){
  //   if(is_liked == false){
  //     button = Unselected_like;
  //   }else if(is_liked == true){
  //     button = active_like;
  //   }
  //   return button;
  // }

  Widget BaseLine_Icon() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Unselected_like),
            selectedIcon: Icon(active_like),
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.messenger)),
        ],
      ),
    );
  }

  List<News> news = [];
  bool isLoading = true;

  initState() {
    super.initState();
    callnews();
  }

  callnews() async {
    news = await fetchNews();
    print(news);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          bottom: const TabBar(
            indicatorColor: Color(0xff0066FF),
            tabs: [
              Tab(
                child: Text(
                  'News',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'SourceSansPro',
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'SourceSansPro',
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "News",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: 'SourceSansPro',
              color: Color(0xff000000),
            ),
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final newsitem = news[index];
                  return Card(
                    child: SizedBox(
                      height: 160,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Text(newsitem.category.toString()),
                              title: Text(newsitem.headline.toString()),
                              subtitle: Text(
                                DateFormat(
                                  'EEEE,MMM d,y'
                                ).format(newsitem.datetime!),
                              ),
                              trailing: newsitem.image != null
                                  ? Image.network(
                                      newsitem.image!,
                                      width: 79,
                                      fit: BoxFit.cover,
                                )
                                  : null,
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              minLeadingWidth: 2,
                              minVerticalPadding: 0,
                            ),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              newsitem.isLiked = !newsitem.isLiked;
                            });
                          },
                              icon: Icon(newsitem.isLiked == false ? Unselected_like : active_like),
                            color: newsitem.isLiked == false ? Colors.black45 :Colors.red,
                                  )
                          // InkWell(
                          //   key: clickKey,
                          //   onTap: () {
                          //     setState(() {
                          //       is_liked = !is_liked;
                          //     });
                          //   },
                          //   child: is_liked
                          //       ? Icon(Unselected_like)
                          //       : Icon(active_like),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

