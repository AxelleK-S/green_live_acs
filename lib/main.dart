import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_live_acs/Service/Auth/login_bloc.dart';
import 'package:green_live_acs/Service/add_farm_bloc/add_farm_bloc.dart';
import 'package:green_live_acs/Service/routing_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:green_live_acs/repository/farm_repository.dart';
import 'package:green_live_acs/repository/user_repository.dart';
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
    UserRepository userRepository = UserRepository(db: db);
    FarmRepository farmRepository = FarmRepository(db: db);
   // final RoutingBloc navigationBloc = BlocProvider.of<RoutingBloc>(context);

    return
      MultiBlocProvider(
        providers: [
          BlocProvider<RoutingBloc>(create: (context) => RoutingBloc(db)),
          BlocProvider<LoginBloc>(create: (context) =>LoginBloc(userRepository: userRepository)),
          BlocProvider(create: (context) => AddFarmBloc(farmRepository: farmRepository)),
        ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF28A80A)),
        useMaterial3: true,
      ),
      home:


        BlocBuilder<RoutingBloc,RoutingState>(
          builder:(context , state ){
            context.read<RoutingBloc>().add(RoutingMainEvent());
            if(state is RoutingDashboard){
              print(state.page.toString());
            }
            return state.page;
          },
        )
      ),

    );
  }
}
