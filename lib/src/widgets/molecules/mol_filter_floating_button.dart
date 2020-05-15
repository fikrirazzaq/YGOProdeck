import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class MolFilterFloatingButton extends StatelessWidget {
  final Function onSortPressed;
  final Function onFilterPressed;

  const MolFilterFloatingButton(
      {Key key, this.onSortPressed, this.onFilterPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: primaryDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onSortPressed,
            child: Row(
              children: [
                SizedBox(width: 10),
                Text('Sort'),
                SizedBox(width: 10),
                Icon(Icons.sort, color: Colors.black54),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(width: 2),
          Container(width: 1, height: 20, color: Colors.black26),
          SizedBox(width: 2),
          InkWell(
            onTap: onFilterPressed,
            child: Row(
              children: [
                SizedBox(width: 10),
                Text('Filter'),
                SizedBox(width: 10),
                Icon(Icons.filter_list, color: Colors.black54),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
