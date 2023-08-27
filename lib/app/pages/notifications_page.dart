
import 'package:at_tareeq/app/widgets/widgets.dart';
import 'package:at_tareeq/core/themes/colors.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: CustomColor.appBlue
        ),
        title: BigText('Notifications'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NotificationItem(text: 'Host near me notifications'),
            Divider(height: 6,),
            NotificationItem(text: 'Host New Lectures notifications'),
            Divider(height: 6,),
            NotificationItem(text: 'Download Complete Notifications'),
            Divider(height: 6,),
          ],
        ),
      ),
    );
  }
}


class NotificationItem extends StatelessWidget {
  NotificationItem({Key? key,
    required this.text,
    this.fontSize = 16,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(text, fontSize: fontSize,),
          SwitchScreen(),
        ],
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget{
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State{
  bool isSwitched = false;

  void toggleSwitch(bool value){
    if(isSwitched == false){
      setState((){
        isSwitched = true;
      });
    }else {
      setState((){
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Transform.scale(
          scale: 1,
          child: Switch(

            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: CustomColor.appBlue,
            activeTrackColor: CustomColor.appPurple,
            inactiveThumbColor: Colors.grey[700],
            inactiveTrackColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}