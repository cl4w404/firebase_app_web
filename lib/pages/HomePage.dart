import 'package:firebase_app_web/Custom/products.dart';
import 'package:firebase_app_web/Service/Auth_Service.dart';
import 'package:firebase_app_web/main.dart';
import 'package:firebase_app_web/pages/main_home.dart';
import 'package:firebase_app_web/pages/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_web/pages/SignUpPage.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Plug Wa Samsung',
          style: GoogleFonts.merienda(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(
                child: Text('HELLO there'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.smartphone_outlined),
              title: Text('Phones'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.laptop),
              title: Text('Laptops'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.headphones),
              title: Text('Assesories'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text('Chat'),
              onTap: () => null,
            ),
        RaisedButton.icon(
        onPressed: () async {
          return showDialog(
            builder: (context) => AlertDialog(
              title: Text('Do you want to exit Plug wa samsung?'),
              content: Text('We hate to see you leave...'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    print("you choose no");
                    Navigator.of(context).pop(false);
                  },
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () {
                    authClass.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => MyApp()),
                            (route) => false);

                  },
                  child: Text('Yes'),
                ),
              ],
            ), context: context,
          ) ??
              false;
        },
            shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.all(Radius.circular(30.0))),
    label: Text(
    'Logout',
    style: TextStyle(color: Colors.white),
    ),
    icon: Icon(
    Icons.logout,
    color: Colors.white,
    ),
    textColor: Colors.white,
    splashColor: Colors.red,
    color: Colors.amber,
        ),
          ],
        ),
      ),
      body: Container(
        width: 2000,
        height: 1200,
        child: Row(
          children: [
            Expanded(
              child: HomeMain(),
            ),

          ],
        ),
      ),
    );
  }



}