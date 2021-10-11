import 'package:firebase_app_web/Custom/products.dart';
import 'package:firebase_app_web/Service/Auth_Service.dart';
import 'package:firebase_app_web/main.dart';
import 'package:firebase_app_web/pages/main_home.dart';
import 'package:firebase_app_web/pages/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_web/pages/SignUpPage.dart';
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
        backgroundColor: Colors.white,
        title: Text(
          'Plug Wa Samsung',
          style: GoogleFonts.merienda(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              color: Colors.amber,
              icon: Icon(Icons.logout),
              onPressed: () async {
                authClass.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => MyApp()),
                    (route) => false);
              }),
        ],
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
            ListTile(),
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
            Expanded(
              child: Positioned(
                right: 0,
                child: SideBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
