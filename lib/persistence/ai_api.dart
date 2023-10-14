// import 'package:project/project.dart' as project;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

String HOST = "http://44.192.247.69:38856";

// Function to get crop recommentdation from the given params
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
  print(value);

  return value;
}

// Function to get the plant disease from image
Future<String> getPlantDisease(String imagePath) async {
  return await postImage(imagePath, HOST, "getPredictionDisease");
}

// Function for Weed detection from image
Future<String> getWeedPrediction(String imagePath) async {
  return await postImage(imagePath, HOST, "getPredictionWeed");
}

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
    print(response.body);
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

void test(List<String> arguments) {
  var data = {
      "N": 90,
      "P": 42,
      "K": 43,
      "temperature": 20.879744,
      "humidity": 75,
      "ph": 5.5,
      "rainfall": 220
  };
  var value = getCropRecommendation(90, 42, 43, 20, 75, 5.5, 220);
  var value2 = getPlantDisease("/home/andrekevin/Documents/greenlive/api/test1.png");
  var value3 = getWeedPrediction("/home/andrekevin/Documents/greenlive/api/test1.png");
  // value.then((value){print(value);});
}


