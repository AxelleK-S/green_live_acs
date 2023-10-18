//  import 'package:dio/dio.dart';
//  import 'package:web_socket_channel/web_socket_channel.dart';
//
// Future<void> main() async {
//   Dio dio = new Dio();
//   await dio.get("http://172.18.0.1:8080/farm/get-farms-byID/toguoleo67@gmail.com");
//
//   // Importe la bibliothèque web_socket_channel
//   Uri uri = Uri.parse("ws://localhost:8080/ws");
// // Crée une instance du canal WebSocket
//   WebSocketChannel channel = WebSocketChannel.connect(uri);
//
//   // channel.sink.add("id-auth-kitID178");
//
// // Connecte-toi au serveur WebSocket
//   channel.stream.listen((message) {
//     // Le serveur a envoyé un message
//     print(message);
//
//     if(message.toString() == "get-credentials"){
//       channel.sink.add("id-auth-Kit139");
//
//     }
//   });
//
// // Envoi des messages au serveur
//   //channel.sink.add("Hello, world!");
//
// }


import 'dart:convert';

import 'model/Data.dart';

void main(){
 var  jsonFIle = """
{
  "ph": 13.32834138111322,
  "humidity": 25.279263573575278,
  "soils": 68.5325338859905,
  "kitId": "f7135eaa-2d77-488d-aebf-d0f59b984f0e",
  "kit_ids": "7899"
}
""" ;
  Data data = Data.fromJson(JsonDecoder().convert(jsonFIle));
 // Créer un tuple de deux valeurs
 var tuple = (1, "Hello, world!");

// Affichage du tuple
  print(tuple); // (1, "Hello, world!")

// Accès aux valeurs du tuple
  print(tuple.$1); // 1
  print(tuple.$2);
}