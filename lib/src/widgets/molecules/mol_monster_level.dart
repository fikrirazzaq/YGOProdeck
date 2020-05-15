import 'package:flutter/material.dart';

import '../widgets.dart';
import '../../shared/shared.dart';

class MolMonsterLevel extends StatelessWidget {
  final int level;

  const MolMonsterLevel({Key key, this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildMonsterLevelWidget(level);
  }

  Widget buildMonsterLevelWidget(int level) {
    return level == null
        ? Container()
        : Row(
            children: List.generate(
              level,
              (index) => Padding(
                padding: EdgeInsets.only(right: 4),
                child: AtmImageNetwork(url: imgStar, height: 16, width: 16),
              ),
            ),
          );
  }
}
