import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  final user = FirebaseAuth.instance.currentUser;
  void logout(){
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamed("/login");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  user == null ? Text("No user") :  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as: '+ user!.email!),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: (){},
              //sign out button
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.teal.shade800,
                        Colors.teal.shade400,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: OutlinedButton(
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    logout();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    fixedSize: Size(180, 60),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
