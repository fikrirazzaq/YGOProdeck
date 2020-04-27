import 'package:flutter/material.dart';

class AtmPrimaryLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black87));
  }
}
