import 'package:clock_app/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}
class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';



    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      alignment: Alignment.center,
      color: Color(0xff2d2f41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Clock",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            formattedTime,
            style: TextStyle(color: Colors.white, fontSize: 64),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            formattedDate,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: FittedBox(
                  child: ClockView(
                    size: 300,
                  ))),
          SizedBox(
            height: 20,
          ),
          Text(
            "TimeZonde",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.language,
                color: Colors.white,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "UTC" + offsetSign + timezoneString,
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          )
        ],
      ),
    );
  }
}
