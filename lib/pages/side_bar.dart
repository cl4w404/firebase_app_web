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
        color: Colors.black,
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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 20),
              child: Container(
                height: 1.0,
                width: 130.0,
                color: Colors.white,
              ),
            ),
            DrawerListTile(
              title: "Profile",
              icon: "assets/person.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Phones",
              icon: "assets/phone.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Laptops",
              icon: "assets/laptop.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Assesories",
              icon: "assets/earphones.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              icon: "assets/settings.png",
              press: () {},
            ),
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
          color: Colors.white,
        ),
      ),
    );
  }
}
