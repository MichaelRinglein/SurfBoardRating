import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/classes/rating_box.dart';
import 'package:surfboard_rating_pwa/classes/ratings_display.dart';
import 'product.dart';

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: constraints.maxWidth > 768
              ? Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 100, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/' + this.item.image, width: 300),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
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
                              RatingDisplay(this.item.name),
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

                              //SizedBox(height: 160),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                ])
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Image.asset('assets/' + this.item.image, width: 300),
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
                    ]),
        ),
      ),
    );
  }
}
