/// 实现原理是利用form自带的onWillPop属性，其余与will_pop_scope_demo中一致。

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class FormPopDemoPage extends StatefulWidget {
  FormPopDemoPage({Key key}) : super(key: key);

  @override
  _FormPopDemoPageState createState() => new _FormPopDemoPageState();
}

class _FormPopDemoPageState extends State<FormPopDemoPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _jobs = <String>['工程师', '教师', '公务员', '医生', '演员'];
  String _name = '';
  String _brath = '';
  String _phone = '';
  String _emial = '';
  String _job = '工程师';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('返回上一页时弹出提示信息'),
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          onWillPop: _onBackPressed,
          key: _formKey,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: '请输入你的名称',
                  labelText: '名称',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '名称不能为空';
                  }
                  return null;
                },
                onSaved: (val) {
                  _name = val;
                },
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: '请输入你的生日',
                  labelText: '出生日期',
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.isEmpty) {
                    return '出生日期不能为空';
                  }
                  return null;
                },
                onSaved: (val) {
                  _brath = val;
                },
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: '请输入你的电话号码',
                  labelText: '电话',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return '电话不能为空';
                  }
                  return null;
                },
                onSaved: (val) {
                  _phone = val;
                },
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: '请输入你的邮箱地址',
                  labelText: '邮箱',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return '邮箱不能为空';
                  }
                  return null;
                },
                onSaved: (val) {
                  _emial = val;
                },
              ),
              new InputDecorator(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.color_lens),
                  labelText: '选择职业',
                ),
                isEmpty: _job == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _job,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _job = newValue;
                      });
                    },
                    items: _jobs.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              new Container(
                  padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                  child: new RaisedButton(
                    color: Colors.red,
                    child: const Text(
                      '提交',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print('表单验证通过');
                        print('名称：' + _name);
                        print('生日：' + _brath);
                        print('电话：' + _phone);
                        print('邮箱：' + _emial);
                        print('职业：' + _job);
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('您真的要退出该应用程序吗,请先保存你的数据'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('确定'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }
}
