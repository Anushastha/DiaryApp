import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:diary/Screens/Dashboard/entry_reader.dart';
import 'package:diary/Screens/Dashboard/newEntry.dart';
import 'package:flutter/material.dart';

import '../widgets/entry_card.dart';


class EntryAdd extends StatelessWidget {
  EntryAdd({Key? key}) : super(key: key);
  final ref = FirebaseFirestore.instance.collection('entries');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Make your entries here.",
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_)=>
                  NewEntry())
          );
        },
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
                                  EntryAdd(),
                            )
                        );
                      },
                      child: GridView(
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
    );
  }
}
