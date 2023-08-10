import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/component/farm_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF28A80A)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
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
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    var farmList = [
      "My pienaple Farm",
      "My pienaple Farm20",
      "My pienaple Farm22",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",
      "My pienaple Farm23",
      "My pienaple Farm24",
      "My pienaple Farm25",






    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.black,
        toolbarHeight: 100,
        leadingWidth: screenWidth,

        title: Padding(
          padding:  EdgeInsets.fromLTRB(8, 120, 8, 120),
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.arrow_back_ios_new),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "My Pineapple Farm",
                      style: GoogleFonts.roboto(fontSize: 25 ,  fontWeight: FontWeight.bold , color: Color(
                          0xFF3E3E41)),
                    ),
                    Text("Douala 5 , Akwa boulevard",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.bold))
                  ]),



              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined))
          ]),
        ),
      ),

      body:Center(
        child: Column(
          children: [


            SizedBox(
              width: screenWidth*0.95,
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                      child: SizedBox(
                        width: screenWidth * 0.90,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Harvest Stats", style: GoogleFonts.roboto(),),
                              Chip(
                                labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                label:
                                DropdownButton(
                                  elevation: 0,
                                  itemHeight:  48,
                                  autofocus: true,
                                  items: [
                                    DropdownMenuItem(child: Text('Option 1'), value: 'Option 1'),
                                    DropdownMenuItem(child: Text('Option 2'), value: 'Option 2'),
                                    DropdownMenuItem(child: Text('Option 3'), value: 'Option 3'),
                                  ],
                                  value: 'Option 1',
                                  onChanged: (value) {  },),
                                avatar: Icon(Icons.calendar_month_rounded),

                              )
                            ]
                        ),
                      ),
                    ),
                    SfCartesianChart(

                        primaryXAxis: CategoryAxis(),
                        // Chart title
                        title: ChartTitle(text: 'Half yearly sales analysis'),
                        // Enable legend
                        legend: Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<_SalesData, String>>[
                          BarSeries<_SalesData, String>(
                              color: Colors.green,
                              dataSource: data,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) => sales.sales,
                              borderRadius: BorderRadius.circular(15),
                              name: 'phosphore',

                              // Enable data label
                              dataLabelSettings: DataLabelSettings(isVisible: false)),
                          BarSeries(dataSource: data2, xValueMapper: (_SalesData sales, _) => sales.year, yValueMapper: (_SalesData sales, _) => sales.sales,borderRadius: BorderRadius.circular(15),color: Colors.blue, name :"humidite" )
                        ]),
                  ],
                ),
              ),
            ),
            SizedBox( height: 30,),
            SizedBox(
              width:  screenWidth*0.9,
              child: Row(
                children: [
                  Text("Characteristics", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),),
                ]
              ),
            ),

            SizedBox(
              width:  screenWidth*0.9,
              child: Container(
                child: Column(
                  children: [

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Row(
                           children: [

                           ],
                         )
                          ],

                        ),
                      ),
                    )

                  ]
                ),
              ),
            )

    
         
          ]
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