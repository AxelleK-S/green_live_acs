import 'dart:developer';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/Service/dashbordBloc/menu_style_bloc.dart';
import 'package:green_live_acs/Service/pie/pie_bloc.dart';
import 'package:green_live_acs/component/boutton_menu.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math' as math;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Service/data_chart_bloc/data_chart_bloc.dart';
import '../Service/data_manage/data_manage_bloc.dart';
import '../ressouces/my_colors.dart';
import 'chat_page.dart';

class DashboardV2 extends StatelessWidget {
  var pieProvider = BlocProvider(create: (_) => PieBloc());
  final shadowColor = const Color(0xFFCCCCCC);
  List<Color> gradientColors = [
    Color(0xff23b6e6),
    Color(0xff028a9e),
  ];

  var values = 'Day';
  String period = 'Day';
  @override
  Widget build(BuildContext context) {
    final routes = ModalRoute.of(context)?.settings.arguments as String;
    print(routes);
    bool showAvg = false;
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    // TODO: implement build
    return BlocProvider(
        create: (context) => MenuStyleBloc(),
        child: BlocBuilder<MenuStyleBloc, MenuStyleState>(
            builder: (context, state) {
          if (state is MenuStyleInitial) {
            return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.read<MenuStyleBloc>().add(MenuStyleEventCLicked());
                  },
                  child: Icon(Icons.add),
                ),
                body: Stack(children: [
                  Center(
                      child: SingleChildScrollView(
                          child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios_new)),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "My Pineapple Farm",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF3E3E41)),
                                  ),
                                  Text("Douala 5 , Akwa boulevard",
                                      style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold))
                                ]),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_horiz_outlined))
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1.5,
                            child: Image.asset("assets/grow.gif"),
                          ),
                          //emoji smile

                          Positioned(
                              right: 30,
                              child: Text('😁️',
                                  style: GoogleFonts.roboto(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth * 0.85,
                        child: BlocBuilder<DataManageBloc, DataManageState>(
                            builder: (context, dataState) {
                          // context.read<DataManageBloc>().add(DataManageLoadEvent(credentials: routes));
                          print(dataState);
                          if (dataState is DataManageInitial) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularPercentIndicator(
                                    percent: dataState.data!.ph! / 100,
                                    progressColor: Colors.green,
                                    lineWidth: 10,
                                    animation: true,
                                    animationDuration: 1200,
                                    center: Text("${dataState.data!.ph}",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    footer: Text('PH',
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    radius: 30),
                                CircularPercentIndicator(
                                    percent: dataState.data!.humidity! / 100,
                                    lineWidth: 10,
                                    animation: true,
                                    progressColor: Colors.blue,
                                    animationDuration: 1200,
                                    center: Text("${dataState.data!.humidity}",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    footer: Text('Humidy',
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    radius: 30),
                                CircularPercentIndicator(
                                    percent: dataState.data!.soils! / 100,
                                    lineWidth: 10,
                                    animation: true,
                                    progressColor: Colors.brown,
                                    animationDuration: 1200,
                                    center: Text("${dataState.data!.soils}",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    footer: Text('Soil',
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    radius: 30)
                              ],
                            );
                            // }
                            // else if (dataState is DataManageInitial) {
                            //   return BlocListener<DataManageBloc, DataManageState>(listener: (context, state) {
                            //     if (state is DataManageInitial) {
                            //       context.read<DataManageBloc>().add(DataManageRenewCredential(credentials: routes));
                            //     }
                            //   },
                            //     child: SizedBox(
                            //       width: 10,
                            //       height: 10,
                            //       child: CircularProgressIndicator(),
                            //     ),
                            //   );
                          }
                          return SizedBox(
                            width: screenWidth * 0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularPercentIndicator(
                                    percent: 0.8,
                                    progressColor: Colors.green,
                                    lineWidth: 10,
                                    animation: true,
                                    animationDuration: 1200,
                                    center: Text("0",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    footer: Text('PH',
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    radius: 30),
                                CircularPercentIndicator(
                                    percent: 0.3,
                                    lineWidth: 10,
                                    animation: true,
                                    progressColor: Colors.blue,
                                    animationDuration: 1200,
                                    center: Text("0",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    footer: Text('Humidy',
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    radius: 30),
                                CircularPercentIndicator(
                                    percent: 0.5,
                                    lineWidth: 10,
                                    animation: true,
                                    progressColor: Colors.brown,
                                    animationDuration: 1200,
                                    center: Text("0",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    footer: Text('Soil',
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    radius: 30)
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BlocProvider(
                        create: (context) => DataChartBloc(credentials: routes),
                        child: BlocBuilder<DataChartBloc, DataChartState>(
  builder: (context, state) {
    return Column(
      children: [
        SizedBox(
                              width: screenWidth * 0.85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${state.title} graph",
                                      style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                            child: Text("Year"),
                                            value: "Year",
                                            onTap: () {
                                              period = "Year";
                                            }),
                                        DropdownMenuItem(
                                            child: Text("Month"),
                                            value: "Month",
                                            onTap: () {
                                              period = "Month";
                                            }),
                                        DropdownMenuItem(
                                            child: Text("Week"),
                                            value: "Week",
                                            onTap: () {
                                              period = "Week";
                                            }),
                                        DropdownMenuItem(
                                            child: Text("Day"),
                                            value: "Day",
                                            onTap: () {
                                              period = "Day";
                                            }),
                                      ],
                                      value: values,
                                      onChanged: (value) {
                                        values = value.toString();
                                      })
                                ],
                              ),
                            ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        SizedBox(
          width: screenWidth * 0.80,
          height: screenHeight * 0.25,
          child: AspectRatio(
            aspectRatio: 1.4,
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
                  mainData(state),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  },
),
                      ),
                    ],
                  ))),
                  state.state
                      ? Container(
                          height: screenHeight,
                          width: screenWidth,
                          color: Colors.black54,
                          child: LayoutBuilder(builder: (context, constraints) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth * 0.95,
                                  height: screenHeight * 0.9,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BouttonMenu(
                                        size: 180,
                                        title: 'chat whit gerom',
                                        icon: Icons.rocket_launch,
                                        color: Colors.redAccent,
                                        func: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatPage(),
                                              ));
                                        },
                                      ),

                                      BouttonMenu(
                                        size: 100,
                                        title: 'Humidity',
                                        icon: Icons.water_drop,
                                        color: Colors.blue,
                                        func: () {
                                          context.read<DataChartBloc>().add(DataChartHumidyEvent(period: period));
                                        },
                                      ).animate().slideY(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear,
                                          ),

                                      BouttonMenu(
                                        size: 75,
                                        title: 'Soils',
                                        icon: Icons.south_america,
                                        color: Colors.brown,
                                        func: () {
                                          context.read<DataChartBloc>().add(DataChartSoilsEvent(period: period));
                                        },
                                      ).animate().slideY(
                                            duration: const Duration(
                                                milliseconds: 600),
                                            curve: Curves.linear,
                                          ),
                                      BouttonMenu(
                                        size: 55,
                                        title: 'Ph',
                                        icon: Icons.thermostat,
                                        color: Colors.green,
                                        func: () {
                                          context.read<DataChartBloc>().add(DataChartPhEvent(period: period));
                                        },
                                      ).animate().slideY(
                                            duration: const Duration(
                                                milliseconds: 700),
                                            curve: Curves.linear,
                                          ),

                                      //  BouttonMenu(size: 100, title: 'Evapotranspiration', icon: Icons.water_drop, color: Colors.blue),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 500))
                      : Container()
                ]));
          }
          return CircularProgressIndicator();
        }));
  }

  // LineChartData avgData() {
  //   return LineChartData(
  //     lineTouchData: const LineTouchData(enabled: false),
  //     gridData: FlGridData(
  //       show: true,
  //       drawHorizontalLine: true,
  //       verticalInterval: 1,
  //       horizontalInterval: 1,
  //       getDrawingVerticalLine: (value) {
  //         return const FlLine(
  //           color: Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingHorizontalLine: (value) {
  //         return const FlLine(
  //           color: Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           reservedSize: 30,
  //           getTitlesWidget: bottomTitleWidgets,
  //           interval: 3,
  //         ),
  //       ),
  //       leftTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: leftTitleWidgets,
  //           reservedSize: 42,
  //           interval: 1,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: true,
  //       border: Border.all(color: const Color(0xff37434d)),
  //     ),
  //     minX: 0,
  //     maxX: 11,
  //     minY: 0,
  //     maxY: 6,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: getSpots(),
  //         isCurved: true,
  //         gradient: LinearGradient(
  //           colors: [
  //             ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                 .lerp(0.2)!,
  //             ColorTween(begin: gradientColors[1], end: gradientColors[0])
  //                 .lerp(0.2)!,
  //           ],
  //         ),
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: const FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           gradient: LinearGradient(
  //             colors: [
  //               ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                   .lerp(0.2)!
  //                   .withOpacity(1),
  //               ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                   .lerp(0.2)!
  //                   .withOpacity(1),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

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
        text = '10L';
        break;
      case 30:
        text = '20L';
        break;
      case 45:
        text = '50L';
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.roboto(
      color: MyColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('6h', style: style);
        break;
      case 20:
        text = Text('8h', style: style);
        break;
      case 35:
        text = Text('10h', style: style);
        break;
      case 50:
        text = Text('12h', style: style);
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

  LineChartData mainData(DataChartState state) {
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
           // getTitlesWidget: bottomTitleWidgets,
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
      maxX: state.MaxX,
      minY: 0,
      maxY: state.MaxY,
      lineBarsData: [
        LineChartBarData(
          spots: state.datas.map((e) => FlSpot(e[0], e[1])).toList(),
          // [
          //   FlSpot(0, 0),
          //   FlSpot(10, 10),
          //   FlSpot(20, 16),
          //   FlSpot(30, 30),
          //   FlSpot(40, 20),
          //   FlSpot(50, 40),
          // ]
          //,
          isCurved: true,
          gradient: LinearGradient(
            colors: [Colors.red, Colors.blue].map((color) => color).toList(),
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
}

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
