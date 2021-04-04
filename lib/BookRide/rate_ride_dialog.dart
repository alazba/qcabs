import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/Components/custom_button.dart';
import 'package:qcabs/Components/entry_field.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Locale/locale.dart';

class RateRideDialog extends StatefulWidget {
  @override
  _RateRideDialogState createState() => _RateRideDialogState();
}

class _RateRideDialogState extends State<RateRideDialog> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(20),
      // height: MediaQuery.of(context).size.height,
      child: Material(
        color: Theme.of(context).backgroundColor,
        child: FadedSlideAnimation(
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            Assets.Driver,
                            height: 72,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'George Smith',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Maruti Suzuki WagonR',
                          style: theme.textTheme.caption,
                        ),
                        Text(
                          'DL 1 ZA 5887',
                          style: theme.textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.getString(Strings.RIDE_FARE),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$ 50.04',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(height: 24),
                        Text(
                          context.getString(Strings.RIDE_FARE),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(context.getString(Strings.WALLET))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
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
              Spacer(),
              Divider(),
              Spacer(),
              Center(
                child: Text(context.getString(Strings.RATE_YOUR_RIDE),
                    style: theme.textTheme.headline6
                        .copyWith(color: theme.hintColor)),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: theme.primaryColor,
                    size: 40,
                  ),
                ),
              ),
              Spacer(),
              EntryField(
                hint: getString(Strings.ADD_COMMENT),
              ),
              Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: context.getString(Strings.SUBMIT),
              ),
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
