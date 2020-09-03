import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'models/CounterModel.dart';
import 'models/SwitcherModel.dart';

class StateProvidePage extends StatefulWidget {
  StateProvidePage({Key key}) : super(key: key);

  @override
  _StateProvidePageState createState() => _StateProvidePageState();
}

class _StateProvidePageState extends State<StateProvidePage> {
  @override
  Widget build(BuildContext context) {
    var counter = CounterModel();
    var switcher = SwitcherModel();
    var providers = Providers();
    //将counter和switcher对象添加进providers
    providers.provide(Provider<CounterModel>.value(counter));
    providers.provide(Provider<SwitcherModel>.value(switcher));
    return ProviderNode(
      providers: providers,
      child: Scaffold(
        appBar: AppBar(
          title: Text('provide状态管理库使用'),
          elevation: 0.0,
        ),
        body: Center(child: CounterProvide()),
      ),
    );
  }
}

// 中间组件
class CounterProvide extends StatelessWidget {
  const CounterProvide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CounterProvideDemo(),
    );
  }
}

// 孙子组件
class CounterProvideDemo extends StatefulWidget {
  CounterProvideDemo({Key key}) : super(key: key);

  @override
  _CounterProvideDemoState createState() => _CounterProvideDemoState();
}

class _CounterProvideDemoState extends State<CounterProvideDemo> {
  @override
  Widget build(BuildContext context) {
    // 第一种获取状态值方式，在种方式不会触发页面更新，只是更新了model里的数据，需要更新页面数据使用第二种方式
    final counterModel = Provide.value<CounterModel>(context);
    return Column(
      children: <Widget>[
        // 第二种获取状态值，监听数据变化 更新页面
        Provide<CounterModel>(
          builder: (context, child, currentCounter) {
            return ActionChip(
              label: Text('${currentCounter.value}'),
              onPressed: () {
                currentCounter.increment();
              },
            );
          },
        ),
        // 第二种获取状态值，监听数据变化 更新页面
        Provide<SwitcherModel>(
          builder: (context, child, currentSwitcher) {
            return Switch(
              value: currentSwitcher.status,
              onChanged: (newValue) {
                currentSwitcher.changeStatus(newValue);
              },
            );
          },
        ),
        RaisedButton(
          child: Text('数据更新'),
          color: Theme.of(context).accentColor, //使用主题颜色
          textTheme: ButtonTextTheme.primary, //
          onPressed: () {
            counterModel.increment();
          },
        )
      ],
    );
  }
}
