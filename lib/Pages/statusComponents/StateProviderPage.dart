import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/CounterModel.dart';
import 'models/SwitcherModel.dart';

class StateProviderPage extends StatelessWidget {
  const StateProviderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => SwitcherModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider状态管理'),
          elevation: 0.0, // 阴影大小
        ),
        body: Center(child: CounterProvider()),
      ),
    );
  }
}

// 中间组件
class CounterProvider extends StatelessWidget {
  const CounterProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CounterProviderDemo(),
    );
  }
}

// 孙子组件
class CounterProviderDemo extends StatefulWidget {
  CounterProviderDemo({Key key}) : super(key: key);

  @override
  _CounterProviderDemoState createState() => _CounterProviderDemoState();
}

class _CounterProviderDemoState extends State<CounterProviderDemo> {
  @override
  Widget build(BuildContext context) {
    // 第一种方式获取数据监听变化更新页面
    final counterModel = context.watch<CounterModel>();
    final currentSwitcher = context.watch<SwitcherModel>();
    // 第二种方式获取数据监听变化更新页面
    //final counterModel = Provider.of<CounterModel>(context, listen: false);
    return Column(
      children: <Widget>[
        ActionChip(
          label: Text('${counterModel.value}'),
          onPressed: () {
            counterModel.increment();
          },
        ),
        Switch(
          value: currentSwitcher.status,
          onChanged: (newValue) {
            currentSwitcher.changeStatus(newValue);
          },
        ),
        RaisedButton(
          child: Text('第一种获取数据更新'),
          color: Theme.of(context).accentColor, //使用主题颜色
          textTheme: ButtonTextTheme.primary, //
          onPressed: () {
            counterModel.increment();
          },
        ),
        childerProvider()
      ],
    );
  }
}

// 子组件单独获取不更新页面
class childerProvider extends StatelessWidget {
  const childerProvider({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 第二种方式获取数据监听变化更新页面
    final counterModel = Provider.of<CounterModel>(context, listen: false);
    return Column(
      children: [
        RaisedButton(
          child: Text('第二种获取数据更新'),
          color: Theme.of(context).accentColor, //使用主题颜色
          textTheme: ButtonTextTheme.primary, //
          onPressed: () {
            counterModel.increment();
          },
        ),
        Text('${counterModel.value}'),
      ],
    );
  }
}
