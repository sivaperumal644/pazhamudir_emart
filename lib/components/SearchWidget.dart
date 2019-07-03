import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: 377,
      height: 55,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
          ),
          Expanded(
              child: TextField(
            style: TextStyle(fontFamily: 'Raleway'),
            decoration: InputDecoration(
                hintStyle: TextStyle(fontFamily: 'Raleway'),
                hintText: "Search for items",
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  size: 30,
                )),
          )),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .15),
            blurRadius: 8,
          )
        ],
        color: WHITE_COLOR,
      ),
    );
  }
}
