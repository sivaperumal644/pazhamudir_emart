import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'package:pazhamuthir_emart_service/screens/EditMemberScreen.dart';

class StaffDetailsCard extends StatelessWidget {
  final StaffModel staff;
  StaffDetailsCard({Key key, this.staff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditMemberDetailsScreen(
                        staff: staff,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${staff.name}',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: BLACK_COLOR,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.edit)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  '${staff.accountType}',
                  style: TextStyle(
                      fontSize: 14,
                      color: GREEN_COLOR,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Token: ${staff.token}',
                  style: TextStyle(color: BLACK_COLOR, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
