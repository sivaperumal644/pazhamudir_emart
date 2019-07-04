import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:pazhamuthir_emart/constants/styles.dart';

class OrderDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Amount Payable',
              style: RaleWayTitle,
            ),
            Spacer(),
            Text(
              'Rs. 5670',
              style: RaleWayTitle.copyWith(color: Colors.green),
            )
          ],
        ),
        Container(
          height: 24,
        ),
        Text(
          'Items in order',
          style: RaleWayTitle,
          textAlign: TextAlign.start,
        ),
        Container(
          height: 8,
        ),
        new OrderItemListItemWidget(),
        new OrderItemListItemWidget(),
        new OrderItemListItemWidget(),
        orderItemTotal(),
        Container(
          height: 24,
        ),
        Text(
          'Delivery Address',
          style: RaleWayTitle,
          textAlign: TextAlign.start,
        ),
        Container(
          height: 8,
        ),
        new AddressItemWidget(),
        new AddressItemWidget(),
        new AddressItemWidget(),
        Row(
          children: <Widget>[
            OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0)),
              child: Text(
                'CALL',
                style: TextStyle(color: GREEN_COLOR),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                'Call the customer',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget orderItemTotal() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: <Widget>[
          Text(
            'Total',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text('Rs. 2450', style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

class AddressItemWidget extends StatelessWidget {
  const AddressItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Deliver to:',
            textAlign: TextAlign.start,
          ),
          Spacer(),
          Expanded(
            child: Text(
              '10/567, Madalayam Road, Janata Nagar, Saravanampatti PO',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class OrderItemListItemWidget extends StatelessWidget {
  const OrderItemListItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: <Widget>[Text('Carrot'), Spacer(), Text('Rs. 450')],
      ),
    );
  }
}
