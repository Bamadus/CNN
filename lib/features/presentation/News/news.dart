import 'package:flutter/material.dart';
import 'package:cnn/features/domain/models/news.dart';
import 'package:cnn/features/data/services/api_services.dart';
import 'package:intl/intl.dart';

import '../bloc/bookmark_button.dart';
import 'bookmark_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  final clickKey= GlobalKey();
  List<IconData> like = [];
  final IconData Unselected_like = Icons.thumb_up_alt_outlined;
  final IconData active_like = Icons.thumb_up;
  final IconData Unselected_bookmark = Icons.bookmark_outline_outlined;
  final IconData active_bookmark = Icons.bookmark;

  // Widget BaseLine_Icon() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 15.0, top: 9),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.baseline,
  //       textBaseline: TextBaseline.alphabetic,
  //       children: [
  //         IconButton(
  //           onPressed: () {},
  //           icon: Icon(Unselected_like),
  //           selectedIcon: Icon(active_like),
  //         ),
  //         IconButton(onPressed: (){}, icon: const Icon(Icons.messenger)),
  //       ],
  //     ),
  //   );
  // }

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
                          SizedBox(
                            height: 25,
                            child: Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(width: 5,),
                                Text(newsitem.category.toString()),
                              ],
                            )),
                          ),
                          Expanded(
                            child: ListTile(
                              // contentPadding: EdgeInsets.only(left: 15, top: 5),
                              // leading: Text(newsitem.category.toString()),
                              title: InkWell(
                                // onDoubleTap: Loading... ,
                                  child: Text(newsitem.headline.toString())),
                              subtitle: Text(
                                DateFormat(
                                  'EEEE,MMM d,y'
                                ).format(newsitem.datetime!),
                              ),
                              trailing: newsitem.image != null
                                  ? Container(
                                margin: EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    height: 115,
                                    // color: Colors.red,
                                    child: Image.network(
                                        newsitem.image!,
                                        width: 115,
                                        fit: BoxFit.fill,
                                                                    ),
                                  )
                                  : null,
                              dense: true,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Container(margin: EdgeInsets.only(left: 15, top: 15),child: Text(newsitem.likes.toString())),
                              IconButton(onPressed: (){
                                setState(() {
                                  newsitem.isLiked = !newsitem.isLiked;
                                  if(newsitem.isLiked == true){
                                    newsitem.likes++;
                                  }else if(newsitem.isLiked == false){
                                    newsitem.likes--;
                                  }
                                });
                              },
                                  icon: Icon(newsitem.isLiked == false ? Unselected_like : active_like),
                                color: newsitem.isLiked == false ? Colors.black45 :Colors.red,
                                      ),
                              BookmarkButton(itemId: newsitem.headline.toString()),
                              // IconButton(onPressed: (){
                              //   setState(() {
                              //     newsitem.bookmark = !newsitem.bookmark;
                              //   });
                              // },
                              //   icon: Icon(newsitem.bookmark == false ? Unselected_bookmark : active_bookmark),
                              //   color: newsitem.bookmark == false ? Colors.black45 :Colors.black45,
                              // ),
                              Container(margin: EdgeInsets.only(left: 178),
                                  child: PopupMenuButton<String>(
                                    onSelected: (value){
                                      if(value == 'bookmark'){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Bookmark_Page()));
                                      }
                                    },
                                      itemBuilder: (BuildContext context)=>[
                                        PopupMenuItem(value: 'delete',child: Text('Delete')),
                                        PopupMenuItem(value: 'bookmark',child: Text('Bookmarks'))

                                      ]
                                  ))
                            ],
                          )
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

