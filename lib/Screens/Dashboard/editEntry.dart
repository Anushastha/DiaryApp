import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryEdit extends StatefulWidget {

  DocumentSnapshot docToEdit;
  EntryEdit({required this.docToEdit});

  @override
  State<EntryEdit> createState() => _EntryEditState();
}

class _EntryEditState extends State<EntryEdit> {
  int color_id = Random().nextInt(CardStyles.CardColor.length);
  String date = DateFormat.yMMMd().add_jm().format(DateTime.now());
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('entries');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CardStyles.CardColor[color_id],
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black),
        backgroundColor: CardStyles.CardColor[color_id],
        elevation: 0.0,
        title: Text(
          "Add a new entry",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            //title
            Container(
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ('Title'),
                ),
              ),
            ),
            SizedBox(height: 2.0),

            //date
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: Text(date, style: CardStyles.date),
            ),
            SizedBox(height: 5.0),
            Divider(
              height: 20.0,
              thickness: 1.0,
            ),
            //content
            Expanded(
              child: Container(
                child: TextField(
                  controller: content,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ('Content'),
                  ),
                  style: CardStyles.mainContent,
                ),
              ),
            ),
            SizedBox(height: 10),
            FloatingActionButton.extended(
              icon: Icon(Icons.save),
              label: Text('Save'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () async {
                // ref.add({
                //   'title': title.text,
                //   'creation_date': date,
                //   'content': content.text,
                //   "color_id": color_id,
                // }).then((value) {
                //   print(value.id);
                //   Navigator.pop(context);
                // }).catchError((error) =>
                //     print("Failed to add entry due to $error"));
              },
            )
          ],
        ),
      ),
    );
  }
}
