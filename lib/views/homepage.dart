import 'package:clock_app/data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:clock_app/views/alarm_page.dart';
import 'package:clock_app/views/clock_page.dart';
import 'package:clock_app/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff2d2f41),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenuInfo) => buildMenuButton(currentMenuInfo)).toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (context,value,Widget?child){
                if(value.menuType == MenuType.clock) return ClockPage();
                if(value.menuType == MenuType.alarm) return AlarmPage();
                else return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context,MenuInfo value ,Widget? child){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentMenuInfo.menuType == value.menuType ? Colors.black12: Colors.transparent,
          ),
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      var menuInfo = Provider.of<MenuInfo>(context,listen: false);
                      menuInfo.updateMenu(currentMenuInfo);

                    },
                    icon: Image.asset(currentMenuInfo.imageSource ?? 'assets/clock_icon.png')),
                Text(
                  currentMenuInfo.title ?? '',
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, fontFamily: 'avenir'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
