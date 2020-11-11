import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/classes/rating_box.dart';
import 'product.dart';

class ProductBox extends StatelessWidget {

  ProductBox({Key key, this.item})
      : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Center(
      //padding: EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/' + this.item.image,
            width: 300
          ),
           Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    this.item.name,
                    style: TextStyle(
                      fontFamily: 'Impact',
                      fontSize: 43,
                      color: const Color(0xff419fbf),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    this.item.description,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 33,
                      color: const Color(0xff419fbf),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    this.item.price.toString() + '\$',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 33,
                      color: const Color(0xff6cafca),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  RatingBox(this.item.name),
                  SizedBox(height: 80),
                ],
              ),
           ),
        ],
      ),
    );
  }
}
