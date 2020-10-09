import 'package:flutter/material.dart';
import '../Pulgs/city_picker.dart';

class CityPickerPage extends StatefulWidget {
  CityPickerPage({Key key}) : super(key: key);

  @override
  _CityPickerPageState createState() => _CityPickerPageState();
}

class _CityPickerPageState extends State<CityPickerPage> {
  String area = '北京';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('城市选择'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            CityPicker.showCityPicker(
              context,
              selectProvince: (province) {
                print(province);
              },
              selectCity: (city) {
                print(city);
              },
              selectArea: (area2) {
                //   print(area2);
                print(area2['name']);
                setState(() {
                  area = area2['name'];
                });
              },
            );
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 15.0, right: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('$area'), Icon(Icons.arrow_drop_down)],
            ),
          ),
        ),
      ),
    );
  }
}
