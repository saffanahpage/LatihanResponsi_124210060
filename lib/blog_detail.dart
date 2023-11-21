import 'package:flutter/material.dart';
import 'package:latihan_responsi_60/blog_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogDetail extends StatelessWidget {
  final Results blog;

  const BlogDetail({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BLOGS DETAIL")),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(blog.imageUrl!),
                    fit: BoxFit.fitWidth)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  blog.title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  blog.summary!,
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _launchUrl(blog.url!);
              },
              child: Icon(Icons.travel_explore))
        ]),
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception("Error! Gagal membuka url");
  }
}
