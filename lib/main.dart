import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_live_acs/Service/Auth/login_bloc.dart';
import 'package:green_live_acs/Service/Auth/sing_up/sign_up_bloc.dart';
import 'package:green_live_acs/Service/FarmBloc/farm_bloc.dart';
import 'package:green_live_acs/Service/accueil/accueil_bloc.dart';
import 'package:green_live_acs/Service/add_farm_bloc/add_farm_bloc.dart';
import 'package:green_live_acs/Service/menu/menu_bloc.dart';
import 'package:green_live_acs/Service/routing_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:green_live_acs/page/add_form_page.dart';
import 'package:green_live_acs/repository/farm_repository.dart';
import 'package:green_live_acs/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:appwrite/appwrite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

// ...
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    // client
    //     .setEndpoint('https://cloud.appwrite.io/v1')
    //     .setProject('64fb469af22bddf9033d')
    //     .setSelfSigned(status: true);
    // storage = Storage(client);
  }

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Client client = Client();
  //late final Storage storage;
  // For self signed certificates, only use for development

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository(db: db, storage: storage);
    FarmRepository farmRepository = FarmRepository(db: db, storage: storage);
    // final RoutingBloc navigationBloc = BlocProvider.of<RoutingBloc>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<RoutingBloc>(
            create: (context) => RoutingBloc(db, userRepository)),
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(userRepository: userRepository, db: db)),
        BlocProvider(
            create: (context) =>
                AddFarmBloc(farmRepository: farmRepository, context: context)),
        BlocProvider(create: (context) => FarmBloc(db)),
        BlocProvider(
            create: (context) => MenuBloc(listButton: [true, false, false])),
        BlocProvider(create: (context) => AccueilBloc(db)),
        BlocProvider(create: (context)=> SignUpBloc(userRepository, db, storage))
      
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF28A80A)),
            useMaterial3: true,
          ),
          home: BlocBuilder<RoutingBloc, RoutingState>(
            builder: (context, state) {
              const String _accessTokenKey = 'email';

              SharedPreferences.getInstance().then((value) {
                bool isAuthenticated = value.getStringList('email') != null;
                print("home aweet homwe");
                print(value.getStringList('email'));
                if (isAuthenticated) {
                  print("nice to meet you");
                  context.read<RoutingBloc>().add(GoHome());
                } else {
                  print("bad news");
                  context.read<RoutingBloc>().add(Login());
                }
              });

              return Scaffold(
                // floatingActionButton: FloatingActionButton(onPressed: () {
                //   context.read<LoginBloc>().add(DelToken());
                //
                // },
                //   child : Icon((Icons.delete))
                //
                // ),
                  body: state.page);
            },
          )),
    );
  }
}

