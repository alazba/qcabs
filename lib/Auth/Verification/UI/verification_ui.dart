import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Components/custom_button.dart';
import 'package:qcabs/Components/entry_field.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'verification_interactor.dart';
import 'package:qcabs/Locale/locale.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  VerificationUI(this.verificationInteractor);

  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  final TextEditingController _otpController =
      TextEditingController(text: '587652');

  @override
  void dispose() {
    _otpController.dispose();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    getString(Strings.ENTER) +
                        '\n' +
                        getString(Strings.VER_CODE),
                    style: theme.textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    getString(Strings.ENTER_CODE_WE),
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
                        controller: _otpController,
                        label: getString(Strings.ENTER_6_DIGIT),
                      ),
                      Spacer(flex: 5),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: getString(Strings.NOT_RECEIVED),
                              onTap: () =>
                                  widget.verificationInteractor.notReceived(),
                              color: theme.scaffoldBackgroundColor,
                              textColor: theme.primaryColor,
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              onTap: () =>
                                  widget.verificationInteractor.verify(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
