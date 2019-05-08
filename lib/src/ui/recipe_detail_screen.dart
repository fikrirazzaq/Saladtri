import 'package:flutter/material.dart';
import 'package:saladtri/src/utils/favorite_icon.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RecipeDetailScreen extends StatefulWidget {
  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  double rating = 4;
  bool _isFavorite;

  @override
  void initState() {
    _isFavorite = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      bottomSheet: BottomSheet(
        enableDrag: false,
        builder: (context) {
          return Container(
            height: 0.065 * MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Text(
              "View Review",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff83600)),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)]),
          );
        },
        onClosing: () {},
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 0.325 * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/background_bezier_three.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 52),
            height: 120,
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'images/background_recipe_detail.png',
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: 0.1 * MediaQuery.of(context).size.height),
                    width: 140,
                    height: 140,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            new AssetImage("images/recipes/popular_first.png"),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Green Goddess Chicken Salad",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    width: 70,
                    height: 1,
                    color: Color(0xfff83600),
                  ),
                  Text(
                    'by caesarcandil',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                        setState(() {
                          rating = v;
                        });
                      },
                      starCount: 5,
                      rating: rating,
                      size: 20.0,
                      color: Colors.amber,
                      borderColor: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 18, left: 18, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'The Green Goddess dressing — a mix of mayonnaise, sour cream, herbs, anchovies and lemon — was created at the Palace Hotel in San Francisco in the 1920s, as a starring in a play tribute actor called The Green Goddess.',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 18, right: 18, left: 18),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                child: Text(
                                  "35\nmin",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xfff83600),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40 / 2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 1)
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text(
                                  'Cooking Time',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                child: Text(
                                  "550",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xfff83600),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40 / 2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 1)
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text(
                                  'Calories per Serving',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 24, left: 18, right: 18),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          color: Colors.black),
                    ),
                  ),
                  _bestOfTheDayList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 36, left: 2, right: 2),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            print("back");
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Details",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(_isFavorite
                              ? FavoriteIcon.like__active_
                              : FavoriteIcon.like__not_active_),
                          onPressed: () {
                            print("kasal");
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bestOfTheDayList() {
    return Container(
      margin: EdgeInsets.only(
          top: 8, bottom: 0.065 * MediaQuery.of(context).size.height),
      height: 175,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 18, right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    'images/ingredients/ing_first.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 165,
                  margin: EdgeInsets.only(top: 2, left: 4),
                  child: Text(
                    'One 2-pound rotisserie chicken',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    'images/ingredients/ing_second.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 165,
                  margin: EdgeInsets.only(top: 2, left: 4),
                  child: Text(
                    'One 1-pound loaf of ciabatta',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    'images/ingredients/ing_third.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 165,
                  margin: EdgeInsets.only(top: 2, left: 4),
                  child: Text(
                    '1/2 cup packed flat-leaf parsley leaves',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
