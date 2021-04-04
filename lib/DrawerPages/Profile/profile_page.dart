import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/Components/custom_button.dart';
import 'package:qcabs/Components/entry_field.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:qcabs/Locale/strings_enum.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController =
      TextEditingController(text: 'Sam Smith');
  TextEditingController _emailController =
      TextEditingController(text: 'samsmith@mail.com');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        getString(Strings.MY_PROFILE),
                        style: theme.textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Text(
                        getString(Strings.YOUR_ACCOUNT_DETAILS),
                        style: theme.textTheme.bodyText2
                            .copyWith(color: theme.hintColor),
                      ),
                    ),
                    Spacer(flex: 2),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      color: theme.backgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Spacer(),
                          EntryField(
                            label: getString(Strings.ENTER_PHONE),
                            initialValue: '+91 9876543210',
                            readOnly: true,
                            showUnderline: false,
                          ),
                          EntryField(
                            controller: _nameController,
                            label: getString(Strings.FULL_NAME),
                            showUnderline: false,
                          ),
                          EntryField(
                            controller: _emailController,
                            label: getString(Strings.EMAIL_ADD),
                            showUnderline: false,
                          ),
                          Spacer(flex: 3),
                          CustomButton(
                            text: getString(Strings.UPDATE),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                PositionedDirectional(
                  top: MediaQuery.of(context).size.height * 0.3 - 50,
                  start: 24,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: theme.hintColor,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: FadedScaleAnimation(Image.asset(Assets.User)),
                  ),
                ),
                PositionedDirectional(
                  top: MediaQuery.of(context).size.height * 0.3 - 50,
                  start: 136,
                  // ignore: deprecated_member_use
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: theme.primaryColor,
                      ),
                      label: Text(
                        getString(Strings.CHANGE_PIC),
                        style: theme.textTheme.caption,
                      )),
                )
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
