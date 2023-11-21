import 'package:flutter/material.dart';
import 'package:latihan_responsi_60/blog.dart';
import 'package:latihan_responsi_60/news.dart';
import 'package:latihan_responsi_60/reports.dart';

class Homepgae extends StatefulWidget {
  const Homepgae({super.key});

  @override
  State<Homepgae> createState() => _HomepgaeState();
}

class _HomepgaeState extends State<Homepgae> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "SPACE FLIGHT NEWS",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NewsPage();
                    }));
                  },
                  child: Container(
                    // color: Colors.white,
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/News.jpg',
                          width: 200,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "NEWS",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites",
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[900]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BlogsPage();
                    }));
                  },
                  child: Container(
                    // color: Colors.white,
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/Blogs.jpg',
                          width: 200,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "BLOGS",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast",
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[900]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ReportsPage();
                    }));
                  },
                  child: Container(
                    // color: Colors.white,
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/Reports.jpg',
                          width: 200,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "REPORTS",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!",
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[900]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
