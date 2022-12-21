// To parse this JSON data, do
//
//     final getHouseNumber = getHouseNumberFromJson(jsonString);
//
// import 'dart:convert';
//
// GetHouseNumber getHouseNumberFromJson(String str) => GetHouseNumber.fromJson(json.decode(str));
//
// String getHouseNumberToJson(GetHouseNumber data) => json.encode(data.toJson());
//
// class GetHouseNumber {
//   GetHouseNumber({
//     required this.result,
//     required this.id,
//     required this.method,
//     required this.jsonrpc,
//   });
//
//   Result result;
//   int id;
//   String method;
//   String jsonrpc;
//
//   factory GetHouseNumber.fromJson(Map<String, dynamic> json) => GetHouseNumber(
//     result: Result.fromJson(json["result"]),
//     id: json["id"],
//     method: json["method"],
//     jsonrpc: json["jsonrpc"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": result.toJson(),
//     "id": id,
//     "method": method,
//     "jsonrpc": jsonrpc,
//   };
// }
//
// class Result {
//   Result({
//     required this.housenrs,
//   });
//
//   List<int> housenrs;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     housenrs: List<int>.from(json["housenrs"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "housenrs": List<dynamic>.from(housenrs.map((x) => x)),
//   };
// }

/*==============================================================================
==============================================================================*/


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GetHouseNumber getHouseNumberFromJson(String str) => GetHouseNumber.fromJson(json.decode(str));

String getHouseNumberToJson(GetHouseNumber data) => json.encode(data.toJson());

class GetHouseNumber {
  GetHouseNumber({
    required this.jsonrpc,
    required this.id,
    required this.method,
    required this.params,
  });

  String jsonrpc;
  int id;
  String method;
  Params params;

  factory GetHouseNumber.fromJson(Map<String, dynamic> json) => GetHouseNumber(
    jsonrpc: json["jsonrpc"],
    id: json["id"],
    method: json["method"],
    params: Params.fromJson(json["params"]),
  );

  Map<String, dynamic> toJson() => {
    "jsonrpc": jsonrpc,
    "id": id,
    "method": method,
    "params": params.toJson(),
  };
}

class Params {
  Params({
    required this.zipcode,
  });

  String zipcode;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "zipcode": zipcode,
  };
}


/*==============================================================================
==============================================================================*/


// To parse this JSON data, do
//
//     final getHouseNumber = getHouseNumberFromJson(jsonString);

// import 'dart:convert';
//
// GetHouseNumber getHouseNumberFromJson(String str) => GetHouseNumber.fromJson(json.decode(str));
//
// String getHouseNumberToJson(GetHouseNumber data) => json.encode(data.toJson());
//
// class GetHouseNumber {
//   GetHouseNumber({
//     required this.title,
//     required this.description,
//     required this.schema,
//     required this.id,
//     required this.type,
//     required this.properties,
//     required this.required,
//   });
//
//   String title;
//   String description;
//   String schema;
//   String id;
//   String type;
//   Properties properties;
//   List<String> required;
//
//   factory GetHouseNumber.fromJson(Map<String, dynamic> json) => GetHouseNumber(
//     title: json["title"],
//     description: json["description"],
//     schema: json["\u0024schema"],
//     id: json["id"],
//     type: json["type"],
//     properties: Properties.fromJson(json["properties"]),
//     required: List<String>.from(json["required"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "title": title,
//     "description": description,
//     "\u0024schema": schema,
//     "id": id,
//     "type": type,
//     "properties": properties.toJson(),
//     "required": List<dynamic>.from(required.map((x) => x)),
//   };
// }
//
// class Properties {
//   Properties({
//     required this.housenrs,
//   });
//
//   Housenrs housenrs;
//
//   factory Properties.fromJson(Map<String, dynamic> json) => Properties(
//     housenrs: Housenrs.fromJson(json["housenrs"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "housenrs": housenrs.toJson(),
//   };
// }
//
// class Housenrs {
//   Housenrs({
//     required this.type,
//     required this.items,
//   });
//
//   String type;
//   Items items;
//
//   factory Housenrs.fromJson(Map<String, dynamic> json) => Housenrs(
//     type: json["type"],
//     items: Items.fromJson(json["items"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": type,
//     "items": items.toJson(),
//   };
// }
//
// class Items {
//   Items({
//     required this.type,
//   });
//
//   String type;
//
//   factory Items.fromJson(Map<String, dynamic> json) => Items(
//     type: json["type"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": type,
//   };
// }
