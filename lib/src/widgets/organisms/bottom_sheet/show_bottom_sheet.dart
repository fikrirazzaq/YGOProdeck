import 'package:flutter/material.dart';

import '../../widgets.dart';

class ShowBottomSheet {
  static Widget filterCards(BuildContext context, {@required onPressedButton}) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetFilterCardOrg(onPressedButton: onPressedButton);
      },
    );
  }

  static Widget sortCards(BuildContext context, {@required onPressedButton}) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetSortCardOrg(onPressedButton: onPressedButton);
      },
    );
  }
}
