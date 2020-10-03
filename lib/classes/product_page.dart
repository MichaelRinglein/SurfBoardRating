import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/classes/product.dart';
import 'package:surfboard_rating_pwa/classes/rating_box.dart';

class ProductPage extends StatelessWidget {

  ProductPage({Key key, this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/' + this.item.image,
                width: 300
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        this.item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(this.item.description),
                      Text('Price: ' + this.item.price.toString()),
                      RatingBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
