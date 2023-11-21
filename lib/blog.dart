import 'package:flutter/material.dart';
import 'package:latihan_responsi_60/blog_detail.dart';
import 'package:latihan_responsi_60/data_source_blog.dart';
// import 'package:latihan_responsi_60/news_detail.dart';
import 'package:latihan_responsi_60/blog_model.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<BlogsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLOG LIST",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: ApiDataSourceBlog.instance.loadBlogs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Text("ADA ERROR");
            }
            if (snapshot.hasData) {
              Blogs blogs = Blogs.fromJson(snapshot.data!);
              return ListView.builder(
                  itemCount: blogs.results!.length,
                  itemBuilder: (BuildContext context, index) {
                    var blog = blogs.results![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BlogDetail(blog: blog);
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
                                  blog.imageUrl!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                blog.title!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.0,
                              ),
                              Text(
                                blog.newsSite!,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
