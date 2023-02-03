// To parse this JSON data, do
//
//     final entryModel = entryModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

EntryModel entryModelFromJson(String str) => EntryModel.fromJson(json.decode(str));

String entryModelToJson(EntryModel data) => json.encode(data.toJson());

class EntryModel {
  EntryModel({
    required this.colorId,
    required this.content,
    required this.creationDate,
    required this.title,
  });

  String colorId;
  String content;
  String creationDate;
  String title;

  factory EntryModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => EntryModel(
    colorId: json["color_id"],
    content: json["content"],
    creationDate: json["creation_date"],
    title: json["title"],
  );

  factory EntryModel.fromJson(Map<String, dynamic> json) => EntryModel(
    colorId: json["color_id"],
    content: json["content"],
    creationDate: json["creation_date"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "color_id": colorId,
    "content": content,
    "creation_date": creationDate,
    "title": title,
  };
}
