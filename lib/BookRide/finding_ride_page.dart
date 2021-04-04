import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:qcabs/Components/background_image.dart';
import 'package:qcabs/Locale/locale.dart';
import 'package:qcabs/Locale/strings_enum.dart';
import 'package:qcabs/Routes/page_routes.dart';

class FindingRidePage extends StatefulWidget {
  @override
  _FindingRidePageState createState() => _FindingRidePageState();
}

class _FindingRidePageState extends State<FindingRidePage>
    with SingleTickerProviderStateMixin {
  final List<double> sizes = [120, 160, 200];

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    Future.delayed(Duration(seconds: 4),
        () => Navigator.pushNamed(context, PageRoutes.rideBookedPage));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: sizes
                .map((element) => CircleAvatar(
                      radius: element * _animation.value,
                      backgroundColor: Theme.of(context)
                          .primaryColor
                          .withOpacity(1 - _animation.value),
                    ))
                .toList(),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
                context.getString(Strings.FINDING_RIDE).toUpperCase() + '...'),
          ),
          body: FadedSlideAnimation(
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.3),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        context.getString(Strings.CANCEL) +
                            '\n' +
                            context.getString(Strings.SEARCH),
                        style: Theme.of(context).textTheme.button.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        )
      ],
    );
  }
}
