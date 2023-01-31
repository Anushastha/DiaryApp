import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:flutter/material.dart';

class EntryReader extends StatefulWidget {
  EntryReader(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<EntryReader> createState() => _EntryReaderState();
}

class _EntryReaderState extends State<EntryReader> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: CardStyles.CardColor[color_id],
      appBar: AppBar(
        backgroundColor: CardStyles.CardColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["title"],
              style: CardStyles.mainTitle,
            ),
            SizedBox(height: 4.0),
            Text(
              widget.doc["creation_date"],
              style: CardStyles.date,
            ),
            SizedBox(height: 28.0),
            Text(
              widget.doc["content"],
              style: CardStyles.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
