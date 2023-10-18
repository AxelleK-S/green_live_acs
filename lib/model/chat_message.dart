class ChatMessage {
  //corps du message
  final String text;
  //date du message
  final String date;
  //si isUser = true c'est le message de l'utilisateur sinon celui du bot
  final bool isUser;

  const ChatMessage({
    required this.text,
    required this.date,
    required this.isUser
  });
}