import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Routes/page_routes.dart';
import 'package:qcabs/Theme/style.dart';
import 'package:qcabs/Locale/locale.dart';

class AppDrawer extends StatelessWidget {
  final bool fromHome;

  AppDrawer([this.fromHome = true]);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: 350,
      child: Drawer(
        child: FadedSlideAnimation(
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                        icon: Icon(Icons.close),
                        color: theme.primaryColor,
                        iconSize: 28,
                        onPressed: () => Navigator.pop(context)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              Assets.User,
                              height: 72,
                              width: 72,
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sam Smith',
                                  style: theme.textTheme.headline5),
                              SizedBox(height: 6),
                              Text('+91 8888888888',
                                  style: theme.textTheme.caption),
                              SizedBox(height: 4),
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
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              buildListTile(context, Icons.home, Strings.HOME, () {
                if (fromHome)
                  Navigator.pop(context);
                else
                  Navigator.pushReplacementNamed(
                      context, PageRoutes.searchLocationPage);
              }),
              buildListTile(context, Icons.person, Strings.MY_PROFILE, () {
                Navigator.popAndPushNamed(context, PageRoutes.profilePage);
              }),
              buildListTile(context, Icons.drive_eta, Strings.MY_RIDES, () {
                Navigator.popAndPushNamed(context, PageRoutes.myRidesPage);
              }),
              buildListTile(
                  context, Icons.account_balance_wallet, Strings.WALLET, () {
                if (fromHome)
                  Navigator.popAndPushNamed(context, PageRoutes.walletPage);
                else
                  Navigator.pushReplacementNamed(
                      context, PageRoutes.walletPage);
              }),
              buildListTile(context, Icons.local_offer, Strings.PROMO_CODE, () {
                if (fromHome)
                  Navigator.popAndPushNamed(context, PageRoutes.promoCodePage);
                else
                  Navigator.pushReplacementNamed(
                      context, PageRoutes.promoCodePage);
              }),
              buildListTile(context, Icons.settings, Strings.SETTINGS, () {
                if (fromHome)
                  Navigator.popAndPushNamed(context, PageRoutes.settingsPage);
                else
                  Navigator.pushReplacementNamed(
                      context, PageRoutes.settingsPage);
              }),
              buildListTile(context, Icons.help, Strings.FAQS, () {
                if (fromHome)
                  Navigator.popAndPushNamed(context, PageRoutes.faqPage);
                else
                  Navigator.pushReplacementNamed(context, PageRoutes.faqPage);
              }),
              buildListTile(context, Icons.mail, Strings.CONTACT_US, () {
                if (fromHome)
                  Navigator.popAndPushNamed(context, PageRoutes.contactUsPage);
                else
                  Navigator.pushReplacementNamed(
                      context, PageRoutes.contactUsPage);
              }),
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, IconData icon, Strings title,
      [Function onTap]) {
    var theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: theme.primaryColor, size: 24),
      title: Text(
        context.getString(title),
        style: theme.textTheme.headline5
            .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
