import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/components/StaffDetailsCard.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'EditMemberScreen.dart';

class StaffScreen extends StatelessWidget {
  StaffModel temporaryStaff = StaffModel(
      accountType: 'DELIVERY_EXECUTIVE',
      name: 'Sivaram',
      phoneNumber: '444444444',
      token: 'E45ERT',
      isActive: true,
      status: 'DEAD',
      id: '232345');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 54),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 16, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Staff',
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'RaleWay',
                            fontWeight: FontWeight.bold)),
                    OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditMemberDetailsScreen(
                                      isNewEntry: true,
                                    )));
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0)),
                      child: Text(
                        'ADD',
                        style: TextStyle(color: GREEN_COLOR),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
                child: StaffDetailsCard(
                  staff: temporaryStaff,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                child: StaffDetailsCard(
                  staff: temporaryStaff,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                child: StaffDetailsCard(
                  staff: temporaryStaff,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                child: StaffDetailsCard(
                  staff: temporaryStaff,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
