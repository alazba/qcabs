import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/Components/background_image.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Theme/style.dart';
import 'package:qcabs/Locale/locale.dart';
import 'rate_ride_dialog.dart';

class RideBookedPage extends StatefulWidget {
  @override
  _RideBookedPageState createState() => _RideBookedPageState();
}

class _RideBookedPageState extends State<RideBookedPage> {
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      showDialog(context: context, builder: (context) => RateRideDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: FadedSlideAnimation(
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onVerticalDragDown: (details) {
                        setState(() {
                          isOpened = !isOpened;
                        });
                      },
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: theme.backgroundColor,
                          borderRadius: isOpened
                              ? BorderRadius.circular(16)
                              : BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                Assets.Driver,
                                height: 72,
                                width: 72,
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'George Smith',
                                  style: theme.textTheme.headline6,
                                ),
                                Spacer(flex: 2),
                                Text(
                                  'Maruti Suzuki WagonR',
                                  style: theme.textTheme.caption,
                                ),
                                Spacer(),
                                Text(
                                  'DL 1 ZA 5887',
                                  style: theme.textTheme.bodyText1,
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppTheme.ratingsColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Text('4.2'),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.star,
                                        color: AppTheme.starColor,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(flex: 2),
                                Text(
                                  getString(Strings.CURRENT_STATUS),
                                  style: theme.textTheme.caption,
                                ),
                                Spacer(),
                                Text(
                                  getString(Strings.ARRIVING),
                                  style: theme.textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Details(isOpened ? 280 : 0),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 72,
                      color:
                          isOpened ? Colors.transparent : theme.backgroundColor,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        buildFlatButton(Icons.call, Strings.CALL_NOW),
                        SizedBox(width: 10),
                        buildFlatButton(Icons.close, Strings.CANCEL),
                        SizedBox(width: 10),
                        buildFlatButton(
                            isOpened
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            isOpened ? Strings.LESS : Strings.MORE, () {
                          setState(() {
                            isOpened = !isOpened;
                          });
                        }),
                      ],
                    ),
                  ),
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

  Widget buildFlatButton(IconData icon, Strings text, [Function onTap]) {
    return Expanded(
      child: FlatButton.icon(
        onPressed: onTap ?? () {},
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        icon: Icon(
          icon,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
        label: Text(
          getString(text),
          style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

class Details extends StatefulWidget {
  final double height;

  Details(this.height);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: widget.height,
      child: Column(
        children: [
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    context.getString(Strings.RIDE_INFO),
                    style: theme.textTheme.headline6
                        .copyWith(color: theme.hintColor),
                  ),
                  trailing: Text('08 km', style: theme.textTheme.headline6),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: theme.primaryColor,
                  ),
                  title: Text('2nd ave, World Trade Center'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.navigation,
                    color: theme.primaryColor,
                  ),
                  title: Text('1124, Golden Point Street'),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                buildRowItem(theme, Strings.PAYMENT_VIA,
                    getString(Strings.WALLET), Icons.account_balance_wallet),
                Spacer(),
                buildRowItem(theme, Strings.RIDE_FARE, '\$ 40.50',
                    Icons.account_balance_wallet),
                Spacer(),
                buildRowItem(theme, Strings.RIDE_TYPE,
                    getString(Strings.PRIVATE), Icons.drive_eta),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildRowItem(
      ThemeData theme, Strings title, String subtitle, IconData icon) {
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
