import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/primary_button_widget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/assign_staff.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/get_all_staff.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'package:pazhamuthir_emart_service/screens/home_screen.dart';
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
    final appState = Provider.of<AppState>(context);
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 36.0),
              child: InkWell(
                onTap: () {
                  appState.setIsStaffSelected(false);
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Assign Staff',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text('Please choose the delivery in-charge',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
            getStaffQuery(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[assignStaffMutation()],
            )
          ],
        ));
  }

  Widget doneButton(RunMutation runMutation) {
    final appState = Provider.of<AppState>(context);
    return SizedBox(
        width: double.infinity,
        child: PrimaryButtonWidget(
          buttonText: 'Done',
          onPressed: assignedStaffId.isNotEmpty
              ? () {
                appState.setIsStaffAssignedSelected(true);
                  runMutation({
                    'staffId': assignedStaffId,
                    'orderId': appState.getOrderId
                  });
                }
              : null,
        ));
  }

  Widget deliveryStaffList(List<StaffModel> staffs) {
    return Expanded(
      child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: staffs.length,
          itemBuilder: (context, index) {
            if (staffs[index].accountType == AccountTypes.DELIVERY &&
                staffs[index].isActive != false)
              return staffWidget(staffs[index]);
            else
              return Container();
          }),
    );
  }

  Padding staffWidget(StaffModel staff) {
    staffName = staff?.name;
    phoneNumber = staff?.phoneNumber;
    final appState = Provider.of<AppState>(context);
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
                    appState.setIsStaffSelected(true);
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
          return deliveryStaffList(staffs);
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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      },
    );
  }
}
