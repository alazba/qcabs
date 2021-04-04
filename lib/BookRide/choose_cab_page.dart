import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Assets/assets.dart';
import 'package:qcabs/Components/background_image.dart';
import 'package:qcabs/Components/custom_button.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Routes/page_routes.dart';

class CabType {
  final String car;
  final String rideType;
  final String cost;

  CabType(this.car, this.rideType, this.cost);
}

class ChooseCabPage extends StatefulWidget {
  @override
  _ChooseCabPageState createState() => _ChooseCabPageState();
}

class _ChooseCabPageState extends State<ChooseCabPage> {
  int _currentCar = 0;

  @override
  Widget build(BuildContext context) {
    final List<CabType> cabs = [
      CabType(Assets.Car1, getString(Strings.SHARE), '40.50'),
      CabType(Assets.Car2, getString(Strings.PRIVATE), '65.50'),
      CabType(Assets.Car3, getString(Strings.LUXURY), '128.20'),
    ];

    return Stack(
      children: [
        BackgroundImage(),
        PositionedDirectional(
          top: 200,
          start: 40,
          child: FadedScaleAnimation(Image.asset(Assets.MapCar, scale: 2)),
        ),
        PositionedDirectional(
          top: 300,
          start: 60,
          child: Transform.rotate(
            angle: 40,
            child: FadedScaleAnimation(Image.asset(Assets.MapCar, scale: 2)),
          ),
        ),
        PositionedDirectional(
          top: 240,
          start: 200,
          child: Transform.rotate(
            angle: 20,
            child: FadedScaleAnimation(Image.asset(Assets.MapCar, scale: 2)),
          ),
        ),
        PositionedDirectional(
          top: 400,
          start: 200,
          child: Transform.rotate(
            angle: 10,
            child: FadedScaleAnimation(Image.asset(Assets.MapCar, scale: 2)),
          ),
        ),
        PositionedDirectional(
          top: 240,
          start: 224,
          child: Transform.rotate(
            angle: 10,
            child: FadedScaleAnimation(Image.asset(Assets.MapCar, scale: 2)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 188,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(end: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentCar = index;
                          });
                        },
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 24),
                                Expanded(
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 350),
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: _currentCar == index
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getString(Strings.GO) +
                                              ' ' +
                                              cabs[index].rideType,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Est. \$' + cabs[index].cost,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            PositionedDirectional(
                              top: 0,
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: FadedScaleAnimation(
                                Image.asset(
                                  cabs[index].car,
                                  height: 120,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              CustomButton(
                text: getString(Strings.RIDE_NOW),
                color: Theme.of(context).scaffoldBackgroundColor,
                textColor: Theme.of(context).primaryColor,
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.findingRidePage),
              )
            ],
          ),
        )
      ],
    );
  }
}
