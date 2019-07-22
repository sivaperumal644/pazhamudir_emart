import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/styles.dart';

class InventoryItemWidget extends StatelessWidget {
  final String photoUrl;
  final String name;
  final String unit;
  final double price;
  final double inStock;

  const InventoryItemWidget(
      {Key key, this.photoUrl, this.name, this.unit, this.price, this.inStock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8.0, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Image.network(
                    'https://befreshcorp.net/wp-content/uploads/2017/06/product-packshot-Carrot-558x600.jpg',
                    height: 64,
                    width: 64,
                  ),
                  Container(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name, style: RaleWayTitle),
                        Container(
                          height: 2,
                        ),
                        Text('Rs. $price/$unit')
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '$inStock $unit in stock',
                        style: TextStyle(fontSize: 14),
                      ),
                      Container(
                        height: 2,
                      ),
                      Icon(Icons.edit)
                    ],
                  )
                ],
              ),
            ),
            Divider(
              indent: 20,
              color: Colors.grey.shade500,
            )
          ],
        ),
      ),
    );
  }
}
