import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/Auth/AddMoney/UI/add_money_interactor.dart';
import 'package:qcabs/Components/custom_button.dart';
import 'package:qcabs/Components/entry_field.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:qcabs/Locale/strings_enum.dart';

class AddMoneyUI extends StatefulWidget {
  final AddMoneyInteractor addMoneyInteractor;

  AddMoneyUI(this.addMoneyInteractor);

  @override
  _AddMoneyUIState createState() => _AddMoneyUIState();
}

class _AddMoneyUIState extends State<AddMoneyUI> {
  TextEditingController _cardNumberController =
      TextEditingController(text: '5555 5555 5555 5555');
  TextEditingController _expiryController =
      TextEditingController(text: '12/25');
  TextEditingController _cvvController = TextEditingController(text: '666');
  TextEditingController _amountController =
      TextEditingController(text: '\$ 500.00');

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset(
                    Assets.QMoneyIcon,
                    height: 72,
                    alignment: AlignmentDirectional.centerStart,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    getString(Strings.ADD_WALLET_MONEY),
                    style: theme.textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    getString(Strings.PAYMENT_MADE_EASY),
                    style: theme.textTheme.bodyText2
                        .copyWith(color: theme.hintColor),
                  ),
                ),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: theme.backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      EntryField(
                        controller: _cardNumberController,
                        label: getString(Strings.CARD_NUMBER),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: EntryField(
                              controller: _expiryController,
                              label: getString(Strings.EXPIRY_DATE),
                            ),
                          ),
                          Expanded(
                            child: EntryField(
                              controller: _cvvController,
                              label: getString(Strings.CVV_CODE),
                            ),
                          ),
                        ],
                      ),
                      EntryField(
                        controller: _amountController,
                        label: getString(Strings.ENTER_AMOUNT),
                      ),
                      Spacer(flex: 3),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: getString(Strings.SKIP),
                              onTap: () => widget.addMoneyInteractor.skip(),
                              color: theme.scaffoldBackgroundColor,
                              textColor: theme.primaryColor,
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              text: getString(Strings.ADD_MONEY),
                              onTap: () => widget.addMoneyInteractor.addMoney(),
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
