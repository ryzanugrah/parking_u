import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      // decoration: BoxDecoration(
      //   color: primaryBackgroundColor,
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: TextField(
        style: TextStyle(fontSize: caption.sp, color: secondaryTextColor),
        cursorColor: secondaryTextColor,
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenWidth(12)),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: primaryColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
            ),
            hintText: "Cari lokasi",
            prefixIcon:
                Icon(Icons.search, color: secondaryTextColor, size: 6.0.w)),
      ),
    );
  }
}