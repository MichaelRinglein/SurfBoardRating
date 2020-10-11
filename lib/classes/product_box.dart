import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/classes/rating_box.dart';
import 'product.dart';

class ProductBox extends StatelessWidget {

  ProductBox({Key key, this.item})
      : super(key: key);

  final Product item;

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
              child: Image.asset('assets/' + this.item.image)),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(this.item.description),
                    Text('Price: ' + this.item.price.toString()),
                    RatingBox(this.item.name),
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
