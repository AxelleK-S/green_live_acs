import 'dart:math';


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/menu2.dart';
import '../component/payement_card.dart';
import '../ressouces/my_colors.dart';


class DashboardPages extends StatelessWidget {


  var object = [
    {
      'color': Colors.green,
      'image': 'assets/briefcase.png',
      'title': 'Salary',
      'date': 'June 28, 20200',
      'cost': '+\$526'
    },
    {
      'color': Colors.brown,
      'image': 'assets/paypal.png',
      'title': 'Paypal',
      'date': 'June 8, 2022',
      'cost': '+\$256'
    },
    {
      'color': Color(0xffFED9A7),
      'image': 'assets/more.png',
      'title': 'More',
      'date': 'June 8, 2022',
      'cost': '+\$256'
    },

  ];

  List<Color> gradientColors = [
    Color(0xff23b6e6),
    Color(0xff028a9e),

  ];

  var darkMode;

  @override
  Widget build(BuildContext context) {
    Brightness theme = Theme
        .of(context)
        .brightness;
    print(theme);
    bool showAvg = false;
    // TODO: implement build
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;


    return Scaffold(
      //  backgroundColor:  (darkMode)?MyColors.primaryColor:MyColors.white,

      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios, size: 24,
                    color: MyColors.primaryColor,
                  )),
              Text('Income History', style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: MyColors.primaryColor,

              )),
              SizedBox(width: 30,)
            ]
        ),

      ),

      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Menu2(Darkmode: false),
              SizedBox(height: 10,),
              SizedBox(

                child: Column(
                    children: [
                      Text('Save This Month', style: GoogleFonts.roboto(
                          color: MyColors.primaryColor,

                          fontSize: 24, fontWeight: FontWeight.w400)),
                      Text('\$1852.00 USD', style: GoogleFonts.roboto(
                          color: MyColors.primaryColor,

                          fontSize: 24, fontWeight: FontWeight.w900)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Increase of', style: GoogleFonts.roboto(
                              color: MyColors.primaryColor,

                              fontSize: 16, fontWeight: FontWeight.w400)),
                          Text(' 12% ', style: GoogleFonts.roboto(
                              color: MyColors.primaryColor,

                              fontSize: 16, fontWeight: FontWeight.w900)),
                          Text('from last month', style: GoogleFonts.roboto(
                              color: MyColors.primaryColor,

                              fontSize: 16, fontWeight: FontWeight.w400)),

                        ],
                      )
                    ]
                ),
              ),
              SizedBox(
                width: screenWidth * 0.85,
                height: screenHeight * 0.28,
                child: AspectRatio(
                  aspectRatio: 1.30,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                      left: 12,
                      top: 24,
                      bottom: 12,
                    ),
                    child: LineChart(
                      showAvg ? avgData() : mainData(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              SizedBox(
                width: screenWidth * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Payments History', style: GoogleFonts.roboto(
                        color: MyColors.primaryColor,

                        fontSize: 24, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(
                width: screenWidth * 0.85,
                height: 138,
                child: PayementCard(object: object,),


              )


            ],
          )
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.roboto(
      color: MyColors.primaryColor,

      fontSize: 14,
      fontWeight: FontWeight.w500,


    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('April', style: style);
        break;
      case 20:
        text = Text('May', style: style);
        break;
      case 35:
        text = Text('June', style: style);
        break;
      case 50 :
        text = Text('July', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }


  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 15,
        verticalInterval: 20,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            dashArray: [1, 1, 1, 1],
            color: Color(0xff37434d),
            strokeWidth: 0.8,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 0.8,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 50,
      minY: 0,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0),
            FlSpot(10, 20),
            FlSpot(20, 10),
            FlSpot(30, 30),
            FlSpot(40, 40),
            FlSpot(50, 20),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [Colors.red, Colors.blue]
                .map((color) => color)
                .toList(),
          ),
          barWidth: 5,
          isStrokeCapRound: false,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            cutOffY: 200,
            applyCutOffY: true,

            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue]
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),

        ),
      ],
    );
  }


  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 3,
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(),
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[1], end: gradientColors[0])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(1),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.roboto(
      color: MyColors.primaryColor,

      fontSize: 14,
      fontWeight: FontWeight.w500,

    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
      case 15:
        text = '10K';
        break;
      case 30 :
        text = '20k';
        break;
      case 45:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }


  List<FlSpot> getSpots() {
    const max = 50;
    const min = 0;
    var rand = Random();
    List<FlSpot> list = [FlSpot(0, 0)];
    for (int i = 0; i < 20; i++) {
      print('${min + rand.nextDouble() * max}');

      var x = min + rand.nextDouble() * max;
      var y = pow(x, 2) + 2 * x + 1;
      print('object: $y');
      list.add(FlSpot(x, y));
    }

    return list;
  }

}
