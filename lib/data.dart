import 'package:clock_app/enums.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:clock_app/models/alarm_info.dart';

List<MenuInfo> menuItems = [
    MenuInfo(MenuType.clock,title: "Clock",imageSource: 'assets/clock_icon.png'),
    MenuInfo(MenuType.alarm,title: "Alarm",imageSource: 'assets/alarm_icon.png'),
    MenuInfo(MenuType.timer,title: "Timer",imageSource: 'assets/timer_icon.png'),
    MenuInfo(MenuType.stopwatch,title: "StopWatch",imageSource: 'assets/stopwatch_icon.png'),
];


/*List<AlarmInfo> alarms = [
    AlarmInfo(DateTime.now().add(Duration(hours: 1)), true, description: "Office"),
    AlarmInfo(DateTime.now().add(Duration(hours: 2)), true, description: "Sports"),
];*/
