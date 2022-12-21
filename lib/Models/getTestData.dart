// To parse this JSON data, do
//
//     final getTestData = getTestDataFromJson(jsonString);

import 'dart:convert';

List<GetTestData> getTestDataFromJson(String str) => List<GetTestData>.from(json.decode(str).map((x) => GetTestData.fromJson(x)));

String getTestDataToJson(List<GetTestData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTestData {
  GetTestData({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory GetTestData.fromJson(Map<String, dynamic> json) => GetTestData(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
