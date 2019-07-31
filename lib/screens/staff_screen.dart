import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/staff_details_card.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/get_all_staff.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'package:provider/provider.dart';

import 'edit_staff_screen.dart';

class StaffScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: Stack(
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
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 16, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Staff',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'RaleWay',
                          fontWeight: FontWeight.bold),
                    ),
                    OutlineButton(
                      onPressed: () {
                        appState.setIsStaffAssignedSelected(false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditMemberDetailsScreen(
                                      isNewEntry: true,
                                    )));
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        'ADD',
                        style: TextStyle(color: GREEN_COLOR),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          getStaffQuery(context),
        ],
      ),
    );
  }

  Padding staffListCard(StaffModel staff) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
      child: StaffDetailsCard(
        staff: staff,
      ),
    );
  }

  Widget staffListComponent(List<StaffModel> staffs) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ListView.builder(
        itemCount: staffs.length,
        itemBuilder: (context, index) {
          if (staffs[index].accountType != AccountTypes.GOD_ADMIN &&
              staffs[index].isActive != false)
            return staffListCard(staffs[index]);
          else
            return Container();
        },
      ),
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
          return Container(
            margin: EdgeInsets.only(top: 100),
            child: staffListComponent(staffs),
          );
        }

        return Container();
      },
    );
  }
}
