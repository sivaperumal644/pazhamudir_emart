import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/styles.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailsWidget extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsWidget({Key key, this.order}) : super(key: key);
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
              'Rs. ${order.getTotalPrice()}',
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
        new AddressItemWidget(
          title: 'Customer Name',
          value: order.address.name,
        ),
        new AddressItemWidget(
          title: 'Contact No.',
          value: order.address.phoneNumber,
        ),
        new AddressItemWidget(
          title: 'Address',
          value: order.address.addressLine,
        ),
        AddressItemWidget(
          title: 'Landmark',
          value: order.address.landmark,
        ),
        Row(
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                launch('tel://${order.address.phoneNumber}');
              },
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
  final String title;
  final String value;
  const AddressItemWidget({
    Key key,
    this.title,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$title:',
            textAlign: TextAlign.start,
          ),
          Spacer(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '$value',
                textAlign: TextAlign.right,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
