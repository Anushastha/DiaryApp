import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Screens/Dashboard/card_styles.dart';
import 'package:diary/Screens/Dashboard/entry_reader.dart';
import 'package:diary/Screens/Dashboard/newEntry.dart';
import 'package:diary/Screens/widgets/entry_card.dart';
import 'package:diary/repository/entry_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Entry extends StatefulWidget {

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  final user = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ref = FirebaseFirestore.instance.collection('entries');

  void logout(){
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamed("/login");
  }

  EntryRepository entryRepository = EntryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CardStyles.mainColor,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Hey there, Welcome! 😊",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 19,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Signed in as:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user!.email!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xffF2F5F9),
              ),
            ),
            ListTile(
              title: Text('Calender'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/calender");
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Logout"),
                      content: Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text("CANCEL"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            logout();
                          },
                          child: Text("LOG OUT"),
                        ),
                      ],
                    );
                  },
                );
              },
            )

          ],
        ),
      ),      // Add Drawer widget to Scaffold
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //checking connection state
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return
                      ListView(
                        children: snapshot.data!.docs
                            .map(
                              (entry) => Dismissible(
                            key: Key(entry.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Confirm"),
                                    content: Text(
                                        "Are you sure you want to delete this entry?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text("CANCEL"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: Text("DELETE"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onDismissed: (direction) {
                              // Delete entry from database
                              entryRepository.deleteEntry(entry.id);
                            },
                            child: entryCard(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EntryReader(entry),
                                ),
                              );
                            }, entry),
                          ),
                        ).toList(),
                    );
                  }
                  return Center(
                    child: Image.asset(
                        'assets/images/empty.png',
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
