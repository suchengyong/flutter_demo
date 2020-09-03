import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;
  bool _ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SwitchDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SwitchListTile(
                value: _switchItemA,
                onChanged: (value) {
                  setState(() {
                    _switchItemA = value;
                  });
                },
                title: Text('Switch Item A'),
                subtitle: Text('Description'),
                secondary: Icon(
                    _switchItemA ? Icons.visibility : Icons.visibility_off),
                selected: _switchItemA,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Switch(
                    // 是否打开
                    value: _ischeck,
                    onChanged: (bool val) {
                      setState(() {
                        _ischeck = val;
                      });
                    },
                  ),
                  Switch.adaptive(
                    value: _ischeck,
                    // 激活时的颜色
                    activeColor: Colors.red,
                    // 非激活状态
                    inactiveThumbColor: Colors.greenAccent,
                    // 非激活状态的 轨道颜色
                    inactiveTrackColor: Colors.yellow,
                    // inactiveThumbImage: ,
                    onChanged: (bool val) {
                      setState(() {
                        _ischeck = val;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
