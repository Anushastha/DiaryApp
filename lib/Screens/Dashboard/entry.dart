import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:diary/Screens/Dashboard/entry_editor.dart';
import 'package:diary/Screens/Dashboard/entry_reader.dart';
import 'package:diary/Screens/widgets/entry_card.dart';
import 'package:flutter/material.dart';

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CardStyles.mainColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        title: Text(
          "Make your entries here.",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 19
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent entries",
              style: CardStyles.mainTitle,
            ),
            SizedBox(height: 20.0),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("entries").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  //checking connection state
                  if(snapshot.connectionState ==ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((entry) => entryCard((){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EntryReader(entry),
                            ));
                      }, entry))
                          .toList(),
                    );
                  }
                  return Text(
                    "There are no entries to show.",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EntryEditor()));
        },
        label: Text("Add Entry"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
