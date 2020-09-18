import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tobias/tobias.dart';

class AlipayTobiasPage extends StatefulWidget {
  @override
  _AlipayTobiasPageState createState() => new _AlipayTobiasPageState();
}

class _AlipayTobiasPageState extends State<AlipayTobiasPage> {
  String _payInfo = "";
  Map _payResult;

  final myController = new TextEditingController();

  void _loadData() {
    _payInfo = "";
    _payResult = {};
    http
        .post(
      "http://120.79.190.42:8071/pay/test_pay/create",
      body: json.encode({"fee": 1, "title": "支付测试"}),
    )
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
        var map = json.decode(response.body);
        int flag = map["flag"];
        if (flag == 0) {
          var result = map["result"];
          setState(() {
            _payInfo = result["credential"]["payInfo"];
            myController.text = _payInfo;
          });
          return;
        }
      }
      throw new Exception("创建订单失败");
    }).catchError((e) {
      setState(() {
        _payInfo = e.toString();
        myController.text = _payInfo;
      });
    });

    setState(() {});
  }

  @override
  initState() {
    super.initState();

    _loadData();
    isAliPayInstalled().then((data) {
      print("installed $data");
    });
  }

  onChanged(String value) {
    _payInfo = value;
  }

  callAlipay() async {
    Map payResult;
    try {
      print("订单信息 : " + _payInfo);
      payResult = await aliPay(_payInfo);
      print("--->$payResult");
    } on Exception catch (e) {
      payResult = {};
    }

    if (!mounted) return;

    setState(() {
      _payResult = payResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('支付宝支付'),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text("输入订单信息"),
            new TextField(
              maxLines: 15,
              onChanged: onChanged,
              controller: myController,
            ),
            new RaisedButton(
              onPressed: callAlipay,
              child: new Text("支付"),
            ),
            new RaisedButton(
                onPressed: () {
                  _loadData();
                },
                child: new Text("重新下单")),
            new Text(_payResult == null ? "" : _payResult.toString())
          ],
        ),
      ),
    );
  }
}
