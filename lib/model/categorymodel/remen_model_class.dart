import 'package:flutter/material.dart';

class RemenModelClass{

String? imgUrl;
String? name;
double? price;
double? rating;
int? distance;

RemenModelClass({this.imgUrl, this.name, this.price, this.rating, this.distance});

static List<RemenModelClass> categoryRemenList = [
  RemenModelClass(
    imgUrl: "images/ramen.png",
    name: "Sapporo Miso",
    rating: 5.0,
    distance: 150,
    price: 3.99
  ),

  RemenModelClass(
      imgUrl: "images/salad.png",
      name: "Kurume ramen",
      rating: 5.0,
      distance: 600,
      price: 5.99
  ),

  RemenModelClass(
      imgUrl: "images/japanese.png",
      name: "jutikla mile",
      rating: 4.5,
      distance: 110,
      price: 8.99
  ),

  RemenModelClass(
      imgUrl: "images/berger.png",
      name: "Sapporo Miso",
      rating: 4.9,
      distance: 180,
      price: 9.99
  ),

  RemenModelClass(
      imgUrl: "images/chiken.png",
      name: "Sapporo Miso",
      rating: 4.8,
      distance: 190,
      price: 3.99
  ),
];
}