import 'package:flutter/material.dart';
import 'package:surfboard_rating_pwa/classes/product.dart';
import 'package:surfboard_rating_pwa/classes/rating_box.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:surfboard_rating_pwa/classes/ratings_display.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key key, this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
        backgroundColor: const Color(0xff4ba3a4),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-0.5, 0.0),
              radius: 10,
              colors: [const Color(0xffa8dfe5), const Color(0xff4ba3a4)],
              stops: [0.0, 1.0],
              transform: GradientXDTransform(
                  1.0, 0.0, 0.0, 4.98, 0.0, -1.99, Alignment(-0.98, 0.0)),
            ),
          ),
        ),
      ),
      body: Stack(children: <Widget>[
        OverflowBox(
          maxWidth: 400,
          alignment: AlignmentDirectional.bottomEnd,
          child: Image(
            image: AssetImage('wave-right.png'),
            fit: BoxFit.contain,
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.01, -0.75),
                radius: 0.719,
                colors: [const Color(0x3de8f8fa), const Color(0x3d35b1db)],
                stops: [0.0, 1.0],
                transform: GradientXDTransform(0.002, 1.0, -0.649, 0.001, 0.39,
                    -0.608, Alignment(0.01, -0.75)),
              ),
            ),
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/' + this.item.image, width: 300),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
