import 'package:flutter/material.dart';
import 'package:latihan_responsi_60/data_source_news.dart';
import 'package:latihan_responsi_60/news_detail.dart';
import 'package:latihan_responsi_60/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NEWS LIST",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: ApiDataSourceNews.instance.loadNews(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Text("ADA ERROR");
            }
            if (snapshot.hasData) {
              News news = News.fromJson(snapshot.data!);
              return ListView.builder(
                  itemCount: news.results!.length,
                  itemBuilder: (BuildContext context, index) {
                    var berita = news.results![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewsDetail(berita: berita);
                        }));
                      },
                      child: Card(
                        elevation: 7.0,
                        margin: EdgeInsets.only(bottom: 16.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  berita.imageUrl!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                berita.title!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.0,
                              ),
                              Text(
                                berita.newsSite!,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    // ListTile(
                    //   title: Text(berita.title!),
                    // subtitle: Text(berita.summary!),
                    // );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
