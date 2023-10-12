 import 'package:dio/dio.dart';
 import 'package:web_socket_channel/web_socket_channel.dart';

Future<void> main() async {
  Dio dio = new Dio();
  await dio.get("http://172.18.0.1:8080/farm/get-farms-byID/toguoleo67@gmail.com");

  // Importe la bibliothèque web_socket_channel
  Uri uri = Uri.parse("ws://localhost:8080/ws");
// Crée une instance du canal WebSocket
  WebSocketChannel channel = WebSocketChannel.connect(uri);

  // channel.sink.add("id-auth-kitID178");

// Connecte-toi au serveur WebSocket
  channel.stream.listen((message) {
    // Le serveur a envoyé un message
    print(message);

    if(message.toString() == "get-credentials"){
      channel.sink.add("id-auth-Kit139");

    }
  });

// Envoi des messages au serveur
  //channel.sink.add("Hello, world!");

}