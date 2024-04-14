import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:beproject/models/data_model.dart';

class DetailsScreen extends StatefulWidget {
  final DataModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Sample data for likes, comments, and views (replace with actual data from server)
    List<ChartData> likesData = [
      ChartData(DateTime(2022, 1), 10),
      ChartData(DateTime(2022, 2), 20),
      ChartData(DateTime(2022, 3), 15),
      ChartData(DateTime(2022, 4), 25),
    ];

    List<ChartData> commentsData = [
      ChartData(DateTime(2022, 1), 5),
      ChartData(DateTime(2022, 2), 15),
      ChartData(DateTime(2022, 3), 10),
      ChartData(DateTime(2022, 4), 20),
    ];

    List<ChartData> viewsData = [
      ChartData(DateTime(2022, 1), 20),
      ChartData(DateTime(2022, 2), 30),
      ChartData(DateTime(2022, 3), 25),
      ChartData(DateTime(2022, 4), 35),
    ];

    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black54),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.data.title,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Hero(
                  tag: widget.data.imageName,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          200,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                              0.5,
                            ),
                            // spreadRadius: 2,
                            // offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        widget.data.imageName,
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Platform: ${widget.data.platform}",
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildChart("Likes", likesData),
                const SizedBox(height: 20),
                _buildChart("Comments", commentsData),
                const SizedBox(height: 20),
                _buildChart("Views", viewsData),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart(String title, List<ChartData> data) {
    final series = [
      charts.Series<ChartData, DateTime>(
        id: 'Data',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartData sales, _) => sales.time,
        measureFn: (ChartData sales, _) => sales.value,
        data: data,
      )
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: charts.TimeSeriesChart(
            series,
            animate: true,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            defaultRenderer: charts.LineRendererConfig(includeArea: true),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final DateTime time;
  final int value;

  ChartData(this.time, this.value);
}
