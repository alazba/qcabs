import 'package:flutter/material.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Locale/locale.dart';

class RowItem extends StatelessWidget {
  final Strings title;
  final String subtitle;
  final IconData icon;

  RowItem(this.title, this.subtitle, this.icon);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString(title),
          style: theme.textTheme.headline6.copyWith(color: theme.hintColor),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(icon, color: theme.primaryColor),
            SizedBox(width: 12),
            Text(
              subtitle,
              style: theme.textTheme.headline6,
            ),
          ],
        )
      ],
    );
  }
}
