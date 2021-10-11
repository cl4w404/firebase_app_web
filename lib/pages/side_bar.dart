import 'package:firebase_app_web/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatefulWidget {
  SideBar({Key key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        //margin: EdgeInsets.all(8.0),
        width: 350,
        // decoration: BoxDecoration(
        // border: Border.all(color: Colors.white),
        //),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: Text(
                "Navigation",
                style: GoogleFonts.merienda(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DrawerListTile(
              title: "Profile",
              icon: "assets/person.png",
              press: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 200.0,
                color: Colors.black,
              ),
            ),
            DrawerListTile(
              title: "Phones",
              icon: "assets/phone.png",
              press: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 200.0,
                color: Colors.black,
              ),
            ),
            DrawerListTile(
              title: "Laptops",
              icon: "assets/laptop.png",
              press: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 200.0,
                color: Colors.black,
              ),
            ),
            DrawerListTile(
              title: "Assesories",
              icon: "assets/earphones.png",
              press: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 200.0,
                color: Colors.black,
              ),
            ),
            DrawerListTile(
              title: "Settings",
              icon: "assets/settings.png",
              press: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 200.0,
                color: Colors.black,
              ),
            ),
            RaisedButton(onPressed: () async {
              var authClass;
              authClass.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => MyApp()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback press;
  const DrawerListTile({Key key, this.title, this.icon, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Image.asset(
        icon,
        height: 25,
        width: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
