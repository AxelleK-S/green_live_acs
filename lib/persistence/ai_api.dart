// import 'package:project/project.dart' as project;

import 'dart:async';
import 'dart:convert';

// pub libs 
import 'package:http/http.dart' as http;  // ensure you install http library

String HOST = "http://34.229.62.33:38856";

// -------------------------- CONVERSATION CLASS -------------------

// context
// Class conversation to chat with the Gerome
class Conversation {
  // lock
  int init_status = 1;
  // Attributes
  String identity = "Gerome";
  String creators = "AI developers and experienced farmers from GREENLIVE";
  String mission  = "an experienced AI farmer developed by AI developers and experienced farmers from GREENLIVE and your role is to help farmers understand the data on their farm";
  String kitIds = "";
  // endpoint
  String endpoint = "getAnswer";
  // messages
  List<Map<String, String>> messages = [];

  // Constructor
  Conversation(String kitIds) {
    this.kitIds = kitIds;
  }

  // Initializer
  // It retrieves the latest data from the kit and initializes the context
  Future<int> init(String kitIds) async {
    Map<String, String> context = {};
    // Create the context of the conversation
    context = {
      "role": "system",
      "content": "Your name is $identity. You were created by $creators. You are $mission. Answer based on the latest data record from this json format : ${await getLatestKitData(kitIds)}"
    };
    // Add the context to messages
    this.messages.add(context);
    // done
    this.init_status = 0;
    //
    return 0;
  }
  
  // Get reply from prompt
  // It is a conversation, so it answers based on all the previous replies.
  Future<String> answer(String prompt) async{
    if (this.init_status==1){
      print("Calling initializer of class Conversation");
      await init(kitIds);
      print("Initialized");
    }
    // query
    Map<String, String> query = {
      "role": "user",
      "content": prompt
    };
    // add query to messages
    this.messages.add(query);
    // Send message to endpoint
    var data = {"messages": this.messages};
    String response = await toEndPoint(data, HOST, endpoint);
    this.messages.add({"role": "assistant", "content": response});
    // Debug -- print(response);
    return response;
  }
}

// --------------------- FUNCTIONS ----------------------------------
// Function to get Crop Recommendation based on the given params
Future<String> getCropRecommendation(int N, int P, int K, double temp, double humidity , double ph, double rainfall) async {
  String endpoint = "getCropRecommandationOutput";
  Map<String, dynamic> data = {
    'N': N,
    'P': P,
    'K': K,
    'temperature': temp,
    'humidity': humidity,
    'ph': ph,
    'rainfall': rainfall
  };
  // Return the output
  var value =  await toEndPoint(data, HOST, endpoint);
  // Debug -- print(value);

  return value;
}

// Function to get plant disease from image
Future<String> getPlantDisease(String imagePath) async {
  return await postImage(imagePath, HOST, "getPredictionDisease");
}

// Function for weed prediction from image
Future<String> getWeedPrediction(String imagePath) async {
  return await postImage(imagePath, HOST, "getPredictionWeed");
}

// --------------------------------- HELPERS ----------------------------------
// Helper function to send an image to and endpoint
Future<String> postImage(String imagePath, String host, String endpoint) async {
  var url = Uri.parse("$HOST/$endpoint");
  // Initialize the request
  var request = http.MultipartRequest('POST', url);
  var image = await http.MultipartFile.fromPath('imagefile', imagePath);
  
  request.files.add(image);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200){
    // Debug -- print(response.body);
    return response.body;
  } else {
    throw Exception('Get plant disease from image failed');
  }
}

// Helper function to send a JSON to an endpoint
Future<String> toEndPoint(Map<String, dynamic> data, String host, String endpoint) async {
  var jsonData = jsonEncode(data);
  // Parse Url
  var url = Uri.parse("$host/$endpoint");

  // send POST request
  var response = await http.post(url, body: jsonData, headers: {"Content-type": "application/json"});

  // Check call to server status
  if (response.statusCode == 200){
    return response.body;
  } else {
    throw Exception('Failed to load data from the server');
  }

}

// Helper function to get the latest data of the kit
Future<String> getLatestKitData(String kitIds) async {
  // request --location
  String location = "https://xqbachpq763c22il5r5wjfxoqa0jscmv.lambda-url.us-east-1.on.aws/";
  // request --data
  var jsonData = jsonEncode({"kitIds": kitIds});
  // url
  Uri url = Uri.parse(location);

  // send POST request
  var response = await http.post(url, body: jsonData, headers: {"Content-Type": "application/json"});

  // Status of request
  if (response.statusCode == 200){
    // Debug -- print(response.body);
    print(response.body);
    return response.body;
  } else {
    throw Exception('Failed to load data from the server');
  }
}

// ----------------------- TEST ------------------------------
// To test the functions
void main(List<String> arguments) async {
  var data = {
      "N": 90,
      "P": 42,
      "K": 43,
      "temperature": 20.879744,
      "humidity": 75,
      "ph": 5.5,
      "rainfall": 220
  };
  var value =  await getCropRecommendation(90, 42, 43, 20, 75, 5.5, 220);
  var value2 = await  getPlantDisease("/home/andrekevin/Documents/greenlive/api/test1.png");
  var value3 = await  getWeedPrediction("/home/andrekevin/Documents/greenlive/api/test1.png");
  var value4 = await  getLatestKitData("6262");

  // Conversation
  Conversation chat = new Conversation("6262");   // 6262 is the kitID

  print(await chat.answer("Hey, mon nom est Kevin. Que ce passe-t'il dans mon champ?"));
  print(await chat.answer("C'est quoi mon nom ?"));
}
