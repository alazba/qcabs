import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Components/background_image.dart';
import 'package:qcabs/Components/custom_button.dart';
import 'package:qcabs/Components/entry_field.dart';
import 'package:qcabs/DrawerPages/app_drawer.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Routes/page_routes.dart';

class SearchLocationPage extends StatefulWidget {
  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        BackgroundImage(),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                theme.primaryColorLight.withOpacity(0.16),
                theme.primaryColorLight.withOpacity(0.0),
              ],
                  stops: [
                0.0,
                0.1
              ])),
        ),
        Center(
          child: CircleAvatar(
            radius: 12,
            backgroundColor: theme.primaryColor.withOpacity(0.3),
            child: CircleAvatar(
              radius: 6,
              backgroundColor: theme.primaryColor,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(getString(Strings.BOOK_YOUR_RIDE).toUpperCase()),
          ),
          drawer: AppDrawer(),
          body: FadedSlideAnimation(
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FadedScaleAnimation(
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        EntryField(
                          showUnderline: false,
                          hint: getString(Strings.ENTER_SOURCE),
                          prefixIcon: Icons.location_on,
                        ),
                        EntryField(
                          showUnderline: false,
                          hint: getString(Strings.ENTER_DESTINATION),
                          prefixIcon: Icons.navigation,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  color: theme.backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 52,
                  child: Row(
                    children: [
                      Text(getString(Strings.PAYMENT_MODE)),
                      Spacer(),
                      Container(
                        width: 1,
                        height: 28,
                        color: theme.hintColor,
                      ),
                      Spacer(),
                      PopupMenuButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              color: theme.primaryColor,
                            ),
                            SizedBox(width: 12),
                            Text(
                              getString(Strings.WALLET),
                              style: theme.textTheme.button
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ],
                        ),
                        offset: Offset(0, -144),
                        color: theme.backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(width: 12),
                                  Text(getString(Strings.CASH)),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.account_balance_wallet),
                                  SizedBox(width: 12),
                                  Text(getString(Strings.WALLET)),
                                ],
                              ),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  color: theme.scaffoldBackgroundColor,
                  textColor: theme.primaryColor,
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.chooseCabPage),
                )
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      ],
    );
  }
}
