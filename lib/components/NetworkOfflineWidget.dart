import 'package:flutter/material.dart';

class NetworkErrorIndicatorWidget extends StatelessWidget {
  final Function refetch;
  const NetworkErrorIndicatorWidget({Key key, this.refetch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.cloud_off,
                    size: 36,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Server could not be connected. Please check your internet connection.',
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.red.shade600,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            if (refetch != null)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  height: 30,
                  child: OutlineButton(
                    onPressed: refetch,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'REFRESH',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.4),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
