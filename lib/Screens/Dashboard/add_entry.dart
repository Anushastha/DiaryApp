import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({Key? key}) : super(key: key);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  int color_id = Random().nextInt(CardStyles.CardColor.length);
  String date =  formatDate(DateTime.now(),[yyyy,"/",mm,"/",dd]);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CardStyles.CardColor[color_id],
      appBar: AppBar(
        backgroundColor: CardStyles.CardColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add a new entry",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
              style: CardStyles.mainTitle,
            ),
            SizedBox(height: 2.0),

            //date
            Text(date, style: CardStyles.date),
            SizedBox(height: 5.0),

            Divider(
              height: 20.0,
              thickness: 1.0,
            ),
            //entry content
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Content',
              ),
              style: CardStyles.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CardStyles.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("entries").add({
            "title" : _titleController.text,
            "creation_date" : date,
            "content" : _mainController.text,
            "color_id" : color_id
          }).then((value){
            print(value.id);
            Navigator.pop(context);
          }).catchError((error)=> print("Failed to add entry due to $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}