import 'package:flutter/material.dart';

import '../../../constants/theme.dart';
import '../../../widgets/triple_rail.dart';

class AllTransactionsTitle extends StatelessWidget {
  const AllTransactionsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45, bottom: 8),
      child: TripleRail(
        middle: Text(
          'All Transactions',
          style: TextStyle(fontSize: 13, color: CTheme.primaryColor),
        ),
      ),
    );
  }
}
