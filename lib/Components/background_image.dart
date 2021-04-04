import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/DrawerPages/Settings/theme_cubit.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Image.asset(
          theme.scaffoldBackgroundColor == Colors.black
              ? Assets.Map
              : Assets.Map1,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        );
      },
    );
  }
}
