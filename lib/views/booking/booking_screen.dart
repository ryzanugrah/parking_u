import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:parking_u/views/booking/components/body.dart';

class BookingScreen extends StatelessWidget {
  static String routeName = "/booking";
  
  final ParkirModel item;

  const BookingScreen({Key key, this.item}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: primaryBackgroundColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Checkout Pesanan",
          style: TextStyle(
            color: primaryTextColor,
            fontSize: headline6,
          ),
        ),
      ),
      body: Body(item: item),
    );
  }
}
