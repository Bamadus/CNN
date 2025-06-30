import 'package:flutter/material.dart';
import 'package:cnn/features/domain/models/news.dart';
import 'package:cnn/features/data/services/api_services.dart';
import 'package:intl/intl.dart';



class NewsPage extends StatefulWidget{
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

   int thumn_counter = 0;
   bool is_liked = false;
    late IconData like;
    final IconData Unselected_like = Icons.thumb_up_alt_outlined;
   final IconData active_like = Icons.thumb_up;

   //  IconData toggleLike(IconData button){
   //   if(is_liked == false){
   //     button = Unselected_like;
   //   }else{
   //     button = active_like;
   //   }
   //   return button;
   // }

  // Widget BaseLine_Icon(final List  card_list) {
  //   return Padding(
  //   padding: const EdgeInsets.only(left: 15.0),
  //   child: Row(
  //     crossAxisAlignment: CrossAxisAlignment.baseline,
  //       textBaseline: TextBaseline.alphabetic,
  //       children: [
  //         IconButton(onPressed: (){ toggleLike(like);}, icon: Icon(like),
  //         ),
  //         IconButton(onPressed: (){}, icon: const Icon(Icons.messenger)),
  //       ],
  //     ),
  // );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            bottom: const TabBar(
                indicatorColor: Color(0xff0066FF),
                tabs:[
                  Tab(child: Text('News',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'SourceSansPro', color: Color(0xff000000)),),),
                  Tab(child: Text('Update',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'SourceSansPro', color: Color(0xff000000)),))
                ]),
            title: Text("News",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'SourceSansPro', color: Color(0xff000000)),),
        ),
        body: FutureBuilder<List<News>>(
          future: fetchNews(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}'));
            }else if(!snapshot.hasData || snapshot.data!.isEmpty){
              return const Center(child: Text('No news available'));
            }
print(snapshot.data);
            final news= snapshot.data!;
            return ListView.builder(
              itemCount: news.length,
                itemBuilder: (context,index){
                final newsitem = news[index];
                return Card(
                  child: SizedBox(
                    height: 140,
                    child: Column(
                      children: [
                        ListTile(
                          leading:Text(newsitem.category.toString()),
                          title: Text(newsitem.headline.toString()),
                          subtitle: Text(DateFormat('EEEE, MMM d,y').format(newsitem.datetime!)),
                          trailing:newsitem.image!=null ? Image.network(newsitem.image!, width: 79, fit: BoxFit.cover,) : null,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 2,
                          minVerticalPadding: 0,
                        ),
                        // BaseLine_Icon(news),
                      ],
                    ),
                  ),
                  );
                }
            );
          },
        )
      ),
    );
  }
}
