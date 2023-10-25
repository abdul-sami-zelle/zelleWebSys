import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BubbleChart extends StatelessWidget {
  const BubbleChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData("2010", 35, 0.32),
      ChartData("2011", 38, 0.21),
      ChartData("2012", 34, 0.38),
      ChartData("2013", 52, 0.99),
      ChartData("2014", 40, 0.34),
      ChartData("2015", 35, 0.32),
      ChartData("2016", 38, 0.21),
      ChartData("2017", 34, 0.38),
      ChartData("2018", 52, 0.99),
      ChartData("2019", 40, 0.34)
    ];
    final List<ChartData> chartData2 = [
      ChartData("2010", 10, 0.1),
      ChartData("2011", 20, 0.12),
      ChartData("2012", 30, 0.66),
      ChartData("2013", 50, 0.65),
      ChartData("2014", 27, 0.94),
      ChartData("2015", 35, 0.32),
      ChartData("2016", 38, 0.21),
      ChartData("2017", 34, 0.38),
      ChartData("2018", 52, 0.99),
      ChartData("2019", 40, 0.34)
    ];
    final List<ChartData> chartData3 = [
      ChartData("2010", 50, 0.1),
      ChartData("2011", 10, 0.76),
      ChartData("2012", 62, 0.56),
      ChartData("2013", 45, 0.55),
      ChartData("2014", 56, 0.45),
      ChartData("2015", 35, 0.32),
      ChartData("2016", 38, 0.21),
      ChartData("2017", 34, 0.38),
      ChartData("2018", 52, 0.99),
      ChartData("2019", 40, 0.34)
    ];
    final List<ChartData> chartData4 = [
      ChartData("2010", 65, 0.34),
      ChartData("2011", 27, 0.87),
      ChartData("2012", 36, 0.56),
      ChartData("2013", 16, 0.34),
      ChartData("2014", 73, 0.34),
      ChartData("2015", 35, 0.32),
      ChartData("2016", 38, 0.21),
      ChartData("2017", 34, 0.38),
      ChartData("2018", 52, 0.99),
      ChartData("2019", 40, 0.34)
    ];
    final List<ChartData> chartData5 = [
      ChartData("2010", 24, 0.76),
      ChartData("2011", 36, 0.34),
      ChartData("2012", 46, 0.76),
      ChartData("2013", 65, 0.87),
      ChartData("2014", 25, 0.45),
      ChartData("2015", 35, 0.32),
      ChartData("2016", 38, 0.21),
      ChartData("2017", 34, 0.38),
      ChartData("2018", 52, 0.99),
      ChartData("2019", 40, 0.34)
    ];

    return Center(
        child: Column(
      children: [
        Container(
            height: 400,
            child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  //Hide the gridlines of x-axis
                  majorGridLines: MajorGridLines(width: 0),
                  //Hide the axis line of x-axis
                  axisLine: AxisLine(width: 0),
                ),
                primaryYAxis: NumericAxis(
                    //Hide the gridlines of y-axis
                    majorGridLines: MajorGridLines(width: 0),
                    //Hide the axis line of y-axis
                    axisLine: AxisLine(width: 0)),
                enableAxisAnimation: true,
                backgroundColor: Color(0xff1F2123),
                series: <ChartSeries>[
                  BubbleSeries<ChartData, String>(
                      dataSource: chartData,
                      color: Color(0xff64FDC2),
                      sizeValueMapper: (ChartData data, _) => data.size,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                  BubbleSeries<ChartData, String>(
                      dataSource: chartData2,
                      color: Color(0xffFFB976),
                      sizeValueMapper: (ChartData data, _) => data.size,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                  BubbleSeries<ChartData, String>(
                      dataSource: chartData3,
                      color: Color(0xffAE8BFF),
                      sizeValueMapper: (ChartData data, _) => data.size,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                  BubbleSeries<ChartData, String>(
                      dataSource: chartData4,
                      color: Color(0xff48A7FF),
                      sizeValueMapper: (ChartData data, _) => data.size,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                  BubbleSeries<ChartData, String>(
                      dataSource: chartData5,
                      color: Color(0xff4832A2),
                      sizeValueMapper: (ChartData data, _) => data.size,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                ])),
        Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BubbleChartLegends(
                legendColor: Color(0xff64FDC2),
                legendName: 'Call Break Hours',
                legendPercent: '5',
              ),
              BubbleChartLegends(
                legendColor: Color(0xffFFB976),
                legendName: 'Namaz Break Hours',
                legendPercent: '5',
              ),
              BubbleChartLegends(
                legendColor: Color(0xffAE8BFF),
                legendName: 'Linch Break Hours',
                legendPercent: '5',
              ),
              BubbleChartLegends(
                legendColor: Color(0xff48A7FF),
                legendName: 'Casual Break Hours',
                legendPercent: '5',
              ),
              BubbleChartLegends(
                legendColor: Color(0xff4832A2),
                legendName: 'Summit Break Hours',
                legendPercent: '5',
              )
            ],
          ),
        )
      ],
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size);
  final String x;
  final double y;
  final double size;
}

class BubbleChartLegends extends StatelessWidget {
  String? legendName;
  Color? legendColor;
  String? legendPercent;
  BubbleChartLegends(
      {super.key,
      required this.legendColor,
      required this.legendName,
      required this.legendPercent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: legendColor, borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 6,
          ),
          Multi(
              color: Colors.white,
              subtitle: "$legendName",
              weight: FontWeight.w300,
              size: 3),
        ],
      ),
    );
  }
}
