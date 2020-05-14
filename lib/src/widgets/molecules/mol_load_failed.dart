import 'package:flutter/material.dart';

class MolLoadFailed extends StatelessWidget {
  final Function onRetryPressed;

  const MolLoadFailed({Key key, this.onRetryPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Failed to fetch data'),
          SizedBox(height: 4),
          IconButton(icon: Icon(Icons.refresh), onPressed: onRetryPressed),
        ],
      ),
    );
  }
}
