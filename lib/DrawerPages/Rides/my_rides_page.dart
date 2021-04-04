import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Routes/page_routes.dart';

class MyRidesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                context.getString(Strings.MY_RIDES),
                style: theme.textTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                context.getString(Strings.LIST_OF_RIDES),
                style:
                    theme.textTheme.bodyText2.copyWith(color: theme.hintColor),
              ),
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.rideInfoPage),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      color: theme.backgroundColor,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(Assets.Driver),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'George Smith',
                                style: theme.textTheme.bodyText2,
                              ),
                              Spacer(flex: 2),
                              Text(
                                'Maruti Suzuki WagonR\nMon, Mar 23 4:16',
                                style: theme.textTheme.caption,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$ 80.50',
                                style: theme.textTheme.bodyText2
                                    .copyWith(color: theme.primaryColor),
                              ),
                              Spacer(flex: 2),
                              Text(
                                context.getString(Strings.WALLET) +
                                    '\n' +
                                    context.getString(Strings.ARRIVING),
                                textAlign: TextAlign.right,
                                style: theme.textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: theme.primaryColor,
                        size: 20,
                      ),
                      title: Text('2nd ave, World Trade Center'),
                      dense: true,
                      hoverColor: theme.cardColor,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.navigation,
                        color: theme.primaryColor,
                        size: 20,
                      ),
                      title: Text('1124, Golden Point Street'),
                      dense: true,
                      hoverColor: theme.cardColor,
                    ),
                    SizedBox(height: 12),
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
    );
  }
}
