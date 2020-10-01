import 'package:flutter/material.dart';

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRatingOneStar() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingTwoStar() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingThreeStar() {
    setState(() {
      _rating = 3;
    });
  }
  void _setRatingFourStar() {
    setState(() {
      _rating = 4;
    });
  }
  void _setRatingFiveStar() {
    setState(() {
      _rating = 5;
    });
  }

  //@override
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1 ?
            Icon(Icons.star, size: _size,) :
            Icon(Icons.star_border, size: _size)),
            color: Colors.orange,
            onPressed: _setRatingOneStar,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 2 ?
            Icon(Icons.star, size: _size,) :
            Icon(Icons.star_border, size: _size)),
            color: Colors.orange,
            onPressed: _setRatingTwoStar,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 3 ?
            Icon(Icons.star, size: _size,) :
            Icon(Icons.star_border, size: _size)),
            color: Colors.orange,
            onPressed: _setRatingThreeStar,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 4 ?
            Icon(Icons.star, size: _size,) :
            Icon(Icons.star_border, size: _size)),
            color: Colors.orange,
            onPressed: _setRatingFourStar,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 5 ?
            Icon(Icons.star, size: _size,) :
            Icon(Icons.star_border, size: _size)),
            color: Colors.orange,
            onPressed: _setRatingFiveStar,
            iconSize: _size,
          ),
        ),
      ]
    );
  }
}
