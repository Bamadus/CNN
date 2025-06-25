import 'package:flutter/material.dart';
import 'package:cnn/features/domain/models/news.dart';
import 'package:cnn/features/data/services/api_services.dart';
import 'package:intl/intl.dart';



class NewsPage extends StatelessWidget{
  const NewsPage({super.key});
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
                  Tab(child: Text('Politics',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'SourceSansPro', color: Color(0xff000000)),),),
                  Tab(child: Text('Business',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'SourceSansPro', color: Color(0xff000000)),))
                ]),
            title: Text("Politics")
        ),
        // body: TabBarView(
        //     children: [
        //       ListView(
        //         shrinkWrap: true,
        //         children: [
        //
        //         ],
        //       ),
        //       const Center(child: Text('People'))
        //     ]),
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
                  child: ListTile(
                    leading: newsitem.image!=null ? Image.network(newsitem.image!, width: 79, fit: BoxFit.cover,) : null,
                    title: Text(newsitem.headlines.toString()),
                    subtitle: Text(DateFormat('yyyy-MM-dd').format(newsitem.datetime!)),),
                  );
                }
            );
          },
        )
      ),
    );
  }
}
