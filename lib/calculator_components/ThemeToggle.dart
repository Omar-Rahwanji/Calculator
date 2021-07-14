import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeToggle extends StatefulWidget {
  ThemeToggle({Key? key}) : super(key: key);

  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  Color activeColor=Colors.purple.withOpacity(0.5);
  Color inactiveColor=Colors.black12;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return ToggleSwitch(
      initialLabelIndex: 0,
      minWidth: deviceWidth*0.25,
      labels: ['Light-Mode','Dark-Mode'],
      fontSize: 16,
      activeBgColor: activeColor,
      inactiveBgColor: inactiveColor,
      onToggle: (index) async{
         if(await AdaptiveTheme.getThemeMode()==AdaptiveThemeMode.light) {
           AdaptiveTheme.of(context).setDark();
           setState(() {
             inactiveColor=Colors.purple.withOpacity(0.5);
             activeColor=Colors.grey;
           });
         }
         else {
           AdaptiveTheme.of(context).setLight();
           setState(() {
             inactiveColor=Colors.black12;
             activeColor=Colors.purple.withOpacity(0.5);
           });
         }
      },
    );
  }
}
