import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/app_state_model.dart';
import 'useful_widgets.dart';

class ProfileMainPage extends StatefulWidget {

  const ProfileMainPage({ Key key}) : super(key: key);

  // final Destination destination;

  @override
  _ProfileMainPageState createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: MainAppBar(), 
          body: WillPopScope(
          onWillPop: () async => null,
          child: ScopedModelDescendant<AppStateModel>(
            builder: (context, child, model) {
              return Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                child: ListView(children: [
                  NiceTitle('Мой профиль'),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: AutoSizeText('${model.user['name']}', style: TextStyle(
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: AutoSizeText('${model.user['phone']}', style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      AutoSizeText('Бонусов на счету', style: TextStyle(
                        color: Colors.black54,
                      )),
                      AutoSizeText('${model.user['bonus']}', style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ))
                    ],),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      AutoSizeText('Совершено заказов', style: TextStyle(
                        color: Colors.black54,
                      )),
                      AutoSizeText('3', style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ))
                    ],),
                  ),
                  NiceLinkItem(context, Icons.shopping_bag, 'Мои заказы', '/login_page'),
                  NiceLinkItem(context, Icons.location_on, 'Мои адреса', '/login_page'),
                  NiceLinkItem(context, Icons.adjust, 'Мои промокоды', '/login_page'),
                  NiceLinkItem(context, Icons.settings, 'Настройки', '/login_page'),
                  NiceLinkItem(context, Icons.exit_to_app, 'Выход', '/login_page'),
                ],)
              );  
            }
          ),
          ),
        );
      }
    );
  }
}