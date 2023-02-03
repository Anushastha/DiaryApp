import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:diary/viewmodel/DiaryViewModel.dart';
import 'package:flutter/material.dart';


class EntryReader extends StatefulWidget {
  EntryReader(this.doc, {Key? key}) : super(key: key);
  DocumentSnapshot doc;
  // DocumentReference ref;

  @override
  State<EntryReader> createState() => _EntryReaderState();
}

class _EntryReaderState extends State<EntryReader> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: CardStyles.CardColor[color_id],
      appBar: AppBar(
        backgroundColor: CardStyles.CardColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              edit = !edit;
            });
          },
              child: Icon(Icons.edit),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
            ),
          ),
          TextButton(onPressed: () async{
            // await widget.ref.delete();
            Navigator.pop(context);
          },
            child: Icon(Icons.delete_forever_rounded),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              enabled: edit,
              initialValue:widget.doc["title"],
              style: CardStyles.mainTitle,
            ),
            SizedBox(height: 15.0),
            Text(
              widget.doc["creation_date"],
              style: CardStyles.date,
            ),
            Divider(
              height: 20.0,
              thickness: 1.0,
            ),
            SizedBox(height: 12.0),

            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              maxLines: null,
              enabled: edit,
              initialValue: widget.doc["content"],
              style: CardStyles.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
