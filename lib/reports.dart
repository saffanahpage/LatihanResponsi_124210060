import 'package:flutter/material.dart';
import 'package:latihan_responsi_60/data_source_reports.dart';
import 'package:latihan_responsi_60/reports_detail.dart';
import 'package:latihan_responsi_60/reports_model.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REPORTS LIST",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: ApiDataSourceReport.instance.loadReports(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Text("ADA ERROR");
            }
            if (snapshot.hasData) {
              Reports reports = Reports.fromJson(snapshot.data!);
              return ListView.builder(
                  itemCount: reports.results!.length,
                  itemBuilder: (BuildContext context, index) {
                    var report = reports.results![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ReportsDetail(report: report);
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
                                  report.imageUrl!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                report.title!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.0,
                              ),
                              Text(
                                report.newsSite!,
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
