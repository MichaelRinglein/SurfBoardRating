import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/classes/rating_box.dart';

class ProductBox extends StatelessWidget {

  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  //@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset('assets/' + image)),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(this.description),
                    Text('Price: ' + this.price.toString()),
                    RatingBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
