import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future showConfirmHarmfulActionDialog(
    {RunMutation runMutation,
    Map<String, dynamic> runMutationData,
    String title,
    String content,
    BuildContext context}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            '$title',
            style: TextStyle(color: Colors.red),
          ),
          content: Text('$content'),
          actions: <Widget>[
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                runMutation(runMutationData);
                Navigator.pop(context);
              },
              child: Text(
                'YES',
                style: TextStyle(color: Colors.red),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('NO'),
            )
          ],
        );
      });
}
