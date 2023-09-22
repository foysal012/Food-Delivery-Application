import 'package:flutter/material.dart';

class SaladModelClass{

  String? imgUrl;
  String? name;
  double? price;
  double? rating;
  int? distance;

  SaladModelClass({this.imgUrl, this.name, this.price, this.rating, this.distance});

  static List<SaladModelClass> categorySaladList = [
    SaladModelClass(
        imgUrl: "images/ramen.png",
        name: "Sapporo Miso",
        rating: 5.0,
        distance: 150,
        price: 3.99
    ),

    SaladModelClass(
        imgUrl: "images/salad.png",
        name: "Kurume ramen",
        rating: 5.0,
        distance: 600,
        price: 5.99
    ),

    SaladModelClass(
        imgUrl: "images/japanese.png",
        name: "jutikla mile",
        rating: 4.5,
        distance: 110,
        price: 8.99
    ),

    SaladModelClass(
        imgUrl: "images/berger.png",
        name: "Sapporo Miso",
        rating: 4.9,
        distance: 180,
        price: 9.99
    ),

    SaladModelClass(
        imgUrl: "images/chiken.png",
        name: "Sapporo Miso",
        rating: 4.8,
        distance: 190,
        price: 3.99
    ),
  ];
}