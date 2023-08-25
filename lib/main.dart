import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_live_acs/Service/routing_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(

  );
  runApp(MyApp());


// ...


}

class MyApp extends StatelessWidget {

  MyApp({super.key});
   FirebaseFirestore db  = FirebaseFirestore.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // final RoutingBloc navigationBloc = BlocProvider.of<RoutingBloc>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF28A80A)),
        useMaterial3: true,
      ),
      home: BlocProvider(create: (context) =>RoutingBloc(this.db) ,
        child: BlocBuilder<RoutingBloc,RoutingState>(
          builder:(context , state ){
            context.read<RoutingBloc>().add(RoutingMainEvent());
            if(state is RoutingDashboard){
              print(state.page.toString());
            }
            return state.page;
          },
        ),
      )

    );
  }
}
