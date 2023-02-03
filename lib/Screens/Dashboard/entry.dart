import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/AddEntry.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:diary/Screens/Dashboard/add_entry.dart';
import 'package:diary/Screens/Dashboard/editEntry.dart';
import 'package:diary/Screens/Dashboard/edit_entry.dart';
import 'package:diary/Screens/Dashboard/entry_reader.dart';
import 'package:diary/Screens/Dashboard/newEntry.dart';
import 'package:diary/Screens/widgets/entry_card.dart';
import 'package:flutter/material.dart';


class Entry extends StatefulWidget {

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  final ref = FirebaseFirestore.instance.collection('entries');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CardStyles.mainColor,
      appBar: AppBar(
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent entries",
              style: CardStyles.mainTitle,
            ),
            SizedBox(height: 15.0),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  //checking connection state
                  if(snapshot.connectionState ==ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  Entry(),
                            )
                        );
                      },
                      child: ListView(
                        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //   crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map((entry) => entryCard((){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        EntryReader(entry),
                              ),
                              );
                        }, entry))
                            .toList(),
                      ),
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
                      NewEntry()));
        },
        label: Text("Add Entry"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
