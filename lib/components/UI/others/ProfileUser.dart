import '../widgets/profile_categories.dart';
import '../widgets/profile_detail.dart';
import '../widgets/profile_menu.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        elevation: 0.0, //阴影大小
      ),
      body: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 10.0,
          ),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileDetail(),
              SizedBox(
                height: 30.0,
              ),
              ProfileCategories(),
              SizedBox(
                height: 30.0,
              ),
              Flexible(child: ProfileMenu()),
            ],
          ),
        ),
      ),
    );
  }
}
