import 'package:flutter/material.dart';
import 'package:qcabs/Auth/login_navigator.dart';
import 'package:qcabs/BookRide/choose_cab_page.dart';
import 'package:qcabs/BookRide/finding_ride_page.dart';
import 'package:qcabs/BookRide/ride_booked_page.dart';
import 'package:qcabs/BookRide/search_location_page.dart';
import 'package:qcabs/DrawerPages/ContactUs/contact_us_page.dart';
import 'package:qcabs/DrawerPages/Profile/profile_page.dart';
import 'package:qcabs/DrawerPages/PromoCode/promo_code_page.dart';
import 'package:qcabs/DrawerPages/Rides/my_rides_page.dart';
import 'package:qcabs/DrawerPages/Rides/ride_info_page.dart';
import 'package:qcabs/DrawerPages/Settings/settings_page.dart';
import 'package:qcabs/DrawerPages/Wallet/send_to_bank_page.dart';
import 'package:qcabs/DrawerPages/Wallet/wallet_page.dart';
import 'package:qcabs/DrawerPages/faq_page.dart';

class PageRoutes {
  static const String loginNavigator = 'login_navigator';
  static const String searchLocationPage = 'search_location_page';
  static const String chooseCabPage = 'choose_cab_page';
  static const String findingRidePage = 'finding_ride_page';
  static const String rideBookedPage = 'ride_booked_page';
  static const String profilePage = 'profile_page';
  static const String myRidesPage = 'my_rides_page';
  static const String rideInfoPage = 'ride_info_page';
  static const String walletPage = 'wallet_page';
  static const String promoCodePage = 'promo_code_page';
  static const String contactUsPage = 'contact_us_page';
  static const String faqPage = 'faq_page';
  static const String sendToBankPage = 'send_to_bank_page';
  static const String settingsPage = 'settings_page';

  Map<String, WidgetBuilder> routes() {
    return {
      loginNavigator: (context) => LoginNavigator(),
      searchLocationPage: (context) => SearchLocationPage(),
      chooseCabPage: (context) => ChooseCabPage(),
      findingRidePage: (context) => FindingRidePage(),
      rideBookedPage: (context) => RideBookedPage(),
      profilePage: (context) => ProfilePage(),
      myRidesPage: (context) => MyRidesPage(),
      rideInfoPage: (context) => RideInfoPage(),
      walletPage: (context) => WalletPage(),
      promoCodePage: (context) => PromoCodePage(),
      contactUsPage: (context) => ContactUsPage(),
      faqPage: (context) => FaqPage(),
      sendToBankPage: (context) => SendToBankPage(),
      settingsPage: (context) => SettingsPage(),
    };
  }
}
