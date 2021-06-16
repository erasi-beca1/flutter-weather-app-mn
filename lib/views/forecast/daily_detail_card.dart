import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_mn/services/calendar.dart';
import 'package:flutter_weather_mn/services/weather.dart';

class DailyDetail extends StatefulWidget {
  final Weather detail;

  DailyDetail({
    this.detail,
  });

  @override
  _DailyDetailState createState() => _DailyDetailState();
}

class _DailyDetailState extends State<DailyDetail> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final Weather weather = widget.detail;
    final size = MediaQuery.of(context).size;

    return InkWell(
      //1 block daily detail
      child: AnimatedContainer(
        width: size.width,
        margin: EdgeInsets.all(22),
        padding: EdgeInsets.symmetric(vertical: 5),
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 24.0)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: FlareActor(
                          "assets/animations/cloudy.flr",
                          alignment: Alignment.center,
                          animation:
                              'cloudy-${weather.getIcon(overrideNight: "")}',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              getWeekday(weather),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: expanded ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${weather.description}".toUpperCase(),
                              style: TextStyle(
                                fontSize: 11,
                                color: expanded ? Colors.white : Colors.black87,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 12, top: 2),
                            child: Text(
                              "MIN",
                              style: TextStyle(
                                fontSize: 11,
                                color: expanded ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 12, top: 2),
                            child: Text(
                              //TK = t°C + 273.15
                              '${(weather.tempMin - 273.15).floor()}°C',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: expanded ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 12, top: 2),
                            child: Text(
                              "MAX",
                              style: TextStyle(
                                fontSize: 11,
                                color: expanded ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 12, top: 2),
                            child: Text(
                              //TK = t°C + 273.15
                              '${(weather.tempMax - 273.15).floor()}°C',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: expanded ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getWeekday(Weather weather) {
    DateTime now =
        DateTime.fromMillisecondsSinceEpoch(weather.date * 1000, isUtc: true);
    DateTime zoneTime = now.add(Duration(seconds: weather.timezone ?? 0));

    return "${CalendarHelper.weekdays[zoneTime.weekday - 1]}".toUpperCase();
  }
}
