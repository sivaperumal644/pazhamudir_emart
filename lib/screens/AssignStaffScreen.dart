import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/components/SecondaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/assignStaff_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/getAllStaff_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/updateStaff_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'package:provider/provider.dart';

class StaffModalWidget extends StatefulWidget {
  const StaffModalWidget({
    Key key,
  }) : super(key: key);

  @override
  _StaffModalWidgetState createState() => _StaffModalWidgetState();
}

class _StaffModalWidgetState extends State<StaffModalWidget> {
  String staffName;
  String phoneNumber;
  String status;
  String assignedStaffId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        body: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Text(
                        'Assign Staff',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text('Please choose the delivery in-charge',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                getStaffQuery(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[assignStaffMutation()],
                )
              ],
            ),
          ],
        ));
  }

  Widget doneButton(RunMutation runMutation) {
    final appState = Provider.of<AppState>(context);
    return SizedBox(
        width: double.infinity,
        child: PrimaryButtonWidget(
          buttonText: 'Done',
          onPressed: () {
            runMutation(
                {'staffId': assignedStaffId, 'orderId': appState.getOrderId});
          },
        ));
  }

  ListView deliveryStaffList(List<StaffModel> staffs) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: staffs.length,
        itemBuilder: (context, index) {
          if (staffs[index].accountType == AccountTypes.DELIVERY)
            return staffWidget(staffs[index]);
          else
            return Container();
        });
  }

  Padding staffWidget(StaffModel staff) {
    staffName = staff?.name;
    phoneNumber = staff?.phoneNumber;
    if (staff.status != null)
      status = staff?.status;
    else
      status = "";

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: GREY_COLOR, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(staffName + ' (' + phoneNumber + ')',
                        style: TextStyle(
                            color: BLACK_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Text(status,
                        style: TextStyle(fontSize: 14, color: GREEN_COLOR))
                  ],
                ),
              ),
              Radio(
                groupValue: assignedStaffId,
                value: staff.id,
                activeColor: PRIMARY_COLOR,
                onChanged: (String value) {
                  setState(() {
                    assignedStaffId = value;
                  });
                },
              ),
            ],
          )),
    );
  }

  Widget getStaffQuery(context) {
    final appState = Provider.of<AppState>(context);
    return Query(
      options: QueryOptions(
        document: getAllStaffQuery,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
        pollInterval: 3,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.loading) return Center(child: CupertinoActivityIndicator());
        if (result.hasErrors)
          return Center(child: Text("Oops something went wrong"));
        if (result.data != null && result.data['getAllStaffs'] != null) {
          List staffList = result.data['getAllStaffs'];
          final staffs =
              staffList.map((item) => StaffModel.fromJson(item)).toList();
          return Container(child: deliveryStaffList(staffs));
        }
        return Container();
      },
    );
  }

  Widget assignStaffMutation() {
    final appState = Provider.of<AppState>(context);

    return Mutation(
      options: MutationOptions(
        document: assignStaffOrderMutation,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
      ),
      builder: (runMutation, result) {
        return doneButton(runMutation);
      },
      onCompleted: (result) {
        Navigator.pop(context);
      },
    );
  }
}
