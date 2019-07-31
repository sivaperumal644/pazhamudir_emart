import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/constants/styles.dart';
import 'package:pazhamuthir_emart_service/model/InventoryItemModel.dart';
import 'package:pazhamuthir_emart_service/screens/edit_inventory_screen.dart';
import 'package:provider/provider.dart';

import '../appState.dart';

class InventoryItemWidget extends StatelessWidget {
  final String id;
  final String name;
  final String unit;
  final double price;
  final double inStock;
  final String searchText;
  final InventoryItemModel inventory;

  const InventoryItemWidget(
      {Key key,
      this.id,
      this.name,
      this.unit,
      this.price,
      this.inStock,
      this.searchText,
      this.inventory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    String timeStamp = DateTime.now().toString();
    if (!name.toLowerCase().contains(searchText.toLowerCase())) {
      return Container();
    }
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              appState.setIsStaffAssignedSelected(false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemModalBottomSheet(
                    isNewInventory: false,
                    id: id,
                    inventory: inventory,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(top: 8.0, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    // FadeInImage.assetNetwork(
                    //   placeholder: 'assets/carrot.png',
                    //   height: 64,
                    //   width: 64,
                    //   image:
                    //       'http://pazhamudhir.herokuapp.com/image/${inventory.id}',
                    //       imageScale: 1.0,
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        'http://pazhamudhir.herokuapp.com/image/${inventory.id}?time=$timeStamp',
                        repeat: ImageRepeat.repeat,
                        fit: BoxFit.cover,
                        width: 64,
                        height: 64,
                      ),
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
                        Icon(
                          Icons.edit,
                          color: Colors.grey.shade500,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 1.0,
            indent: 20,
            endIndent: 20,
            color: Colors.grey.shade500,
          )
        ],
      ),
    );
  }
}
