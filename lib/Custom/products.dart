import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ProductItemView extends StatefulWidget {
  final product;
  const ProductItemView({Key key, this.product}) : super(key: key);
  _ProductItemViewState createState() => _ProductItemViewState();
}

class _ProductItemViewState extends State<ProductItemView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/joseph.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.all(8.0),
          //child: Center(
          //child: Text('hello'),
          // ),
        ),
        Text('phone'),
        Text("ksh20,000"),
        RaisedButton(
          color: Colors.amber,
          child: Text("add to cart"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class ProductItem {
  String title;
  String price;
  bool added;
  ProductItem({
    this.title,
    this.price,
    this.added = false,
  });
}
