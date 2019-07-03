import 'package:flutter/material.dart';
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
              child: Text('CALL'),
            )
          ],
        )
      ],
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
