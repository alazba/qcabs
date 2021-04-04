import 'package:flutter/material.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:qcabs/Locale/strings_enum.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;
  final textColor;
  final BorderRadius borderRadius;
  final IconData icon;

  CustomButton({
    this.onTap,
    this.text,
    this.color,
    this.textColor,
    this.borderRadius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return icon != null
        ? FlatButton.icon(
            padding: EdgeInsets.all(20),
            shape: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.zero,
              borderSide: BorderSide.none,
            ),
            color: color ?? theme.primaryColor,
            onPressed: onTap ?? () {},
            icon: Icon(
              icon,
              color: textColor ?? theme.scaffoldBackgroundColor,
            ),
            label: Text(
              text != null
                  ? text.toUpperCase()
                  : context.getString(Strings.CONTINUE).toUpperCase(),
              style: theme.textTheme.button
                  .copyWith(color: textColor ?? theme.scaffoldBackgroundColor),
            ),
          )
        : FlatButton(
            padding: EdgeInsets.all(20),
            shape: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.zero,
              borderSide: BorderSide.none,
            ),
            color: color ?? theme.primaryColor,
            onPressed: onTap ?? () {},
            child: Text(
              text != null
                  ? text.toUpperCase()
                  : context.getString(Strings.CONTINUE).toUpperCase(),
              style: theme.textTheme.button
                  .copyWith(color: textColor ?? theme.scaffoldBackgroundColor),
            ),
          );
  }
}
