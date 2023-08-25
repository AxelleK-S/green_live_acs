import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../component/data_composant.dart';

class DashboardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];

    List<_SalesData> data2=[
      _SalesData('Jan', 25),
      _SalesData('Feb', 20),
      _SalesData('Mar', 30),
      _SalesData('Apr', 25),
      _SalesData('May', 30)
    ];
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: Colors.black,
          toolbarHeight: 100,
          leadingWidth: screenWidth,

          title: Padding(
            padding: EdgeInsets.fromLTRB(8, 120, 8, 120),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () { Navigator.pop(context); },
                  icon: Icon(Icons.arrow_back_ios_new)),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "My Pineapple Farm",
                          style: GoogleFonts.roboto(fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                  0xFF3E3E41)),
                        ),
                        Text("Douala 5 , Akwa boulevard",
                            style: GoogleFonts.roboto(
                                fontSize: 10, fontWeight: FontWeight.bold))
                      ]),


                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.more_horiz_outlined))
                ]),
          ),
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
                children: [


                  SizedBox(
                    width: screenWidth * 0.95,
                    height: screenHeight * 0.45,
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                            child: SizedBox(
                              width: screenWidth * 0.90,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text("Harvest Stats",
                                      style: GoogleFonts.roboto(),),
                                    Chip(
                                      labelPadding: EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      label:
                                      DropdownButton(
                                        elevation: 0,
                                        itemHeight: 48,
                                        autofocus: true,
                                        items: [
                                          DropdownMenuItem(
                                              child: Text('Option 1'),
                                              value: 'Option 1'),
                                          DropdownMenuItem(
                                              child: Text('Option 2'),
                                              value: 'Option 2'),
                                          DropdownMenuItem(
                                              child: Text('Option 3'),
                                              value: 'Option 3'),
                                        ],
                                        value: 'Option 1',
                                        onChanged: (value) {},),
                                      avatar: Icon(
                                          Icons.calendar_month_rounded),

                                    )
                                  ]
                              ),
                            ),
                          ),
                          Expanded(
                            child: SfCartesianChart(

                                primaryXAxis: CategoryAxis(),
                                // Chart title
                                title: ChartTitle(
                                    text: 'Half yearly sales analysis'),
                                // Enable legend
                                legend: Legend(isVisible: true),
                                // Enable tooltip
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <ChartSeries<_SalesData, String>>[
                                  BarSeries<_SalesData, String>(
                                      color: Colors.green,
                                      dataSource: data,
                                      xValueMapper: (_SalesData sales,
                                          _) => sales.year,
                                      yValueMapper: (_SalesData sales,
                                          _) => sales.sales,
                                      borderRadius: BorderRadius.circular(15),
                                      name: 'phosphore',

                                      // Enable data label
                                      dataLabelSettings: DataLabelSettings(
                                          isVisible: false)),
                                  BarSeries(dataSource: data2,
                                      xValueMapper: (_SalesData sales,
                                          _) => sales.year,
                                      yValueMapper: (_SalesData sales,
                                          _) => sales.sales,
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.blue,
                                      name: "humidite")
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Row(
                        children: [
                          Text("Characteristics", style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w500),),
                        ]
                    ),
                  ),

                  SingleChildScrollView(
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      child: Container(
                        child: Column(
                            children: [

                              DataComposant(),
                              DataComposant(),
                              DataComposant(),
                              DataComposant(),

                            ]
                        ),
                      ),
                    ),
                  )


                ]
            ),
          ),
        )
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}