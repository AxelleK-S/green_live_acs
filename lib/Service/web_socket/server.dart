import 'package:dio/dio.dart';
import 'package:green_live_acs/env.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Server {
  late WebSocketChannel channel;
  //Server({required this.channel});

  //conection function
  void conection() {
    channel = WebSocketChannel.connect(Uri.parse(uris));
  }

  WebSocketChannel getChannel() {
    return channel;
  }

  //ask credentials
  void askCredentials() {
    channel.sink.add("RENEW_CREDENTIALS");
  }

  //close conection
  void close() {
    channel.sink.close();
  }

  void sendCredentials(String? credentials) {
    print(credentials!+"yeeeh");
    channel.sink.add("id-auth-"+credentials!);
  }

  //get stream
  Stream getStream() {
    return channel.stream;
  }
}
// Future<void> main() async {
//
//   // Importe la bibliothèque web_socket_channel
//   Uri uri = Uri.parse(uris);
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
//     if(message.toString() == "GET_CREDENTIALS"){
//       channel.sink.add("id-auth-Kit139");
//
//     }
//   });

// Envoi des messages au serveur
//channel.sink.add("Hello, world!");

//}
