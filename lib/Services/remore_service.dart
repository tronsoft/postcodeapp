// import 'package:postcodeapp/Models/getHouseNumber.dart';
// import 'package:postcodeapp/Models/getTestData.dart';
import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:postcodeapp/Views/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class RemoteServiceHouse{
  var client = http.Client();

  var state = HomePage.myState();



  Future<dynamic> getHouseNumbers() async{
    //postcode als verplichte var bij aanroepen functie
    //json object maken
    var data = {'jsonrpc': '2.0', 'id': 1, 'method': "get_housenrs", 'params': {"zipcode": "$postcode" }};
    String username = 'j.deron@mkbvoice.nl';
    String password = 'A7ttLTJaYXiPFLR';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    String json = jsonEncode(data);

    var uri = Uri.parse('https://api.nextpertise.nl/postcodes/v1');
    var response = await client.post(
        uri,
        headers: <String, String>{'authorization': basicAuth},
        body: json
    ) ;
    print(response.body);
    if(response.statusCode == 200){
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return responseJson['result']['housenrs'];
    }
  }
}

/*
class RemoteServiceTest{
  Future<List<GetTestData>?> getTestData() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return getTestDataFromJson(json);
    }
  }
}*/
