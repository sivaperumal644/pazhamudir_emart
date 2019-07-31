import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  FocusNode focusNode;
  SearchWidget({Key key, FocusNode focusNode}) : super(key: key) {
    this.focusNode = focusNode;
  }

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 24,
          ),
          Expanded(
              child: TextField(
                  focusNode: widget.focusNode,
                  onChanged: (str) {
                    appState.setSearchText(str);
                  },
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 18,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                    ),
                    hintText: "Search for items",
                  ))),
          Container(
            width: 4,
          ),
          IconButton(
            icon: Icon(searchText.isEmpty ? Icons.search : Icons.cancel),
            onPressed: () {},
          )
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
