import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_live_acs/Service/Auth/login_bloc.dart';
import 'package:green_live_acs/Service/Auth/sing_up/sign_up_bloc.dart';
import 'package:green_live_acs/Service/FarmBloc/farm_bloc.dart';
import 'package:green_live_acs/Service/accueil/accueil_bloc.dart';
import 'package:green_live_acs/Service/add_farm_bloc/add_farm_bloc.dart';
import 'package:green_live_acs/Service/data_manage/data_manage_bloc.dart';
import 'package:green_live_acs/Service/menu/menu_bloc.dart';
import 'package:green_live_acs/Service/routing_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green_live_acs/Service/web_socket/server.dart';
import 'package:green_live_acs/persistence/Api.dart';
import 'package:green_live_acs/repository/data_repository.dart';
import 'package:green_live_acs/repository/farm_repository.dart';
import 'package:green_live_acs/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'env.dart';
import 'package:appwrite/appwrite.dart';

import 'firebase_options.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  MyApp({super.key}) {
    // client
    //     .setEndpoint('https://cloud.appwrite.io/v1')
    //     .setProject('64fb469af22bddf9033d')
    //     .setSelfSigned(status: true);
    // storage = Storage(client);
  }

  FirebaseFirestore db =  FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Api api = new Api(baseUrl: api_url);
  Server server = new Server();

  Client client = Client();
  //late final Storage storage;
  // For self signed certificates, only use for development
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      // L'application est mise en pause
      //  isAppRunning = false;
        break;
      case AppLifecycleState.resumed:
        this.server.askCredentials();
        // L'application est reprise
        //  isAppRunning = true;
        break;
      case AppLifecycleState.detached:
        this.server.close();
        // L'application est détachée
        //  isAppRunning = false;
        break;
      case AppLifecycleState.inactive:
      // TODO: Handle this case.
        break;
      default:
        break;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    this.server.conection();

    UserRepository userRepository = UserRepository(db: db, storage: storage);
    FarmRepository farmRepository = FarmRepository(db: db, storage: storage , api: api);
    DataRepository dataRepository = DataRepository(api: api);
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
        BlocProvider(create: (context) => FarmBloc(db, farmRepository: farmRepository)),
        BlocProvider(
            create: (context) => MenuBloc(listButton: [true, false, false])
        ),
        BlocProvider(create: (context) => AccueilBloc(db)),
        BlocProvider(create: (context)=> SignUpBloc(userRepository, db, storage)),
        BlocProvider(create: (context)=>DataManageBloc(dataRepository: dataRepository , server: server , func: (){})),
      
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
                bool isAuthenticated = value.getString('email') != null;
                print("home aweet homwe");
               // print(value.getStringList('email'));
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

