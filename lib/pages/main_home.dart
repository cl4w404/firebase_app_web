import 'package:firebase_app_web/Custom/products.dart';
import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  HomeMain({Key key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: 1200,
      color: Colors.white,
      // child: GridView.builder(
      //itemBuilder: (context, index) => ProductItemView(),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //  crossAxisCount: 3,
      // childAspectRatio: 1 / 1.0,
      // ),
      // ),
    );
  }
}
