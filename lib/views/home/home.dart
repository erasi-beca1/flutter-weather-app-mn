import 'package:flutter/material.dart';
import 'package:flutter_weather_mn/services/location.dart';
import 'package:flutter_weather_mn/services/theme_manager.dart';
import 'package:flutter_weather_mn/views/weather/weather_screen.dart';
import 'package:flutter_weather_mn/components/hamburger.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final int accent;
  final bool loading;
  final bool isDrawerOpen;
  final Location location;
  final void Function() onNavPress;
  final void Function() onMorePress;
  final Animation<double> controller;
  Home({
    @required this.isDrawerOpen,
    @required this.onMorePress,
    @required this.onNavPress,
    this.accent = 0,
    this.controller,
    this.location,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double factor = isDrawerOpen ? 0.8 : 1;
    Color bgColor = Provider.of<ThemeManager>(context).bgColor;

    final double y = isDrawerOpen ? 115 : 0;
    final double x = isDrawerOpen ? (size.width - size.width * 0.8) / 2 : 0;

    return GestureDetector(
      child: AnimatedContainer(
        padding: EdgeInsets.all(24),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(x, y, 0)..scale(factor),
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: isDrawerOpen
              ? [BoxShadow(color: Colors.black38, blurRadius: 40.0)]
              : [],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 24 : 0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hamburger(
                    isDrawerOpen: isDrawerOpen,
                    onPressed: onNavPress,
                  ),
                  IconButton(
                    iconSize: 36,
                    onPressed: loading || isDrawerOpen ? null : onMorePress,
                    icon: Icon(
                      Icons.show_chart,
                      size: 36,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height - 120,
              child: LocationScreen(
                controller: controller,
                location: location,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

