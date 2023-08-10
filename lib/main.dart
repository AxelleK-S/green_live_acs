import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/component/farm_card.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF010726)),
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
      "My pienaple Farm23",
      "My pienaple Farm23",

    ];
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black,
        toolbarHeight: 150,
        leadingWidth: screenWidth,
        leading: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.70,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: GoogleFonts.roboto(fontSize: 30),
                          ),
                          Text("ACS",
                              style: GoogleFonts.roboto(
                                  fontSize: 30, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  const Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("assets/avatar.jpg"),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ]),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Divider(
                      //thickness: 20,c
                      ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.45,
            child: Card(
              elevation: 0,
              child: SingleChildScrollView(
                child: Column(children: [
                  ...farmList
                      .map(
                        (e) => Card(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                            elevation: 0,
                            child: FarmCard()),
                      )
                      .toList(),
                ]),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.9,
              child: Card(
                margin: EdgeInsets.fromLTRB(0, 60,  0, 0),
                color: Color(0xFF000000),
                  child: MaterialButton(
                      onPressed: () {}, child: Text("+ Add Farm" , style: GoogleFonts.roboto(color: Colors.white,))))

          )],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
