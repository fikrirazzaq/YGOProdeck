import 'package:flutter/material.dart';

import '../../widgets.dart';

class ShowBottomSheet {
  static Widget filterCards(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetFilterCardOrg();
      },
    );
  }

  static Widget sortCards(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetSortCardOrg();
      },
    );
  }
}
