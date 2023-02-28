import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:diary/repository/entry_repository.dart';
import 'package:flutter/material.dart';

class EntryReader extends StatefulWidget {
  EntryReader(this.doc, {Key? key}) : super(key: key);

  DocumentSnapshot doc;

  @override
  State<EntryReader> createState() => _EntryReaderState();
}

class _EntryReaderState extends State<EntryReader> {
  bool edit = false;
  bool changesMade = false;

  final ref = FirebaseFirestore.instance.collection('entries');

  EntryRepository entryRepository = EntryRepository();

  Future<void> delete(String id) async {
    await ref.doc(id).delete();
  }

  Future<void> saveChanges() async {
    await ref.doc(widget.doc.id).update({
      "title": _titleController.text,
      "content": _contentController.text,
      "last_edit_date": DateTime.now().toString(),
    });
    setState(() {
      changesMade = false;
      edit = false;
    });
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.doc["title"];
    _contentController.text = widget.doc["content"];
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

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
          TextButton(
            onPressed: () {
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
          if (edit)
            TextButton(
              onPressed: changesMade ? saveChanges : null,
              child: Text(
                'SAVE',
                style: TextStyle(
                  color: changesMade ? Colors.black : Colors.grey,
                ),
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
              controller: _titleController,
              style: CardStyles.mainTitle,
              onChanged: (value) {
                setState(() {
                  changesMade = true;
                });
              },
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
              controller: _contentController,
              style: CardStyles.mainContent,
              onChanged: (value) {
                setState(() {
                  changesMade = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
