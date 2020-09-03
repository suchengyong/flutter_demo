import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelPage extends StatefulWidget {
  ScopedModelPage({Key key}) : super(key: key);

  @override
  _ScopedModelPageState createState() => _ScopedModelPageState();
}

class _ScopedModelPageState extends State<ScopedModelPage> {
  @override
  Widget build(BuildContext context) {
    // 根组件
    return ScopedModel(
      model: CounterModel(), // 使用的model
      child: Scaffold(
        appBar: AppBar(
          title: Text('scoped_modal状态管理库使用'),
          elevation: 0.0,
        ),
        body: Center(child: CounterScopedModel()),
        // 需要ScopedModelDescendant这个包装才能拿到model里面方法
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false, //数据发生变化时这个按钮不需要重建所以设置false
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // 调用model里面的方法
              model.increaseCount();
            },
          ),
        ),
      ),
    );
  }
}

// 中间组件
class CounterScopedModel extends StatelessWidget {
  const CounterScopedModel({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDemoModel(),
    );
  }
}

// 孙子组件
class CounterDemoModel extends StatelessWidget {
  const CounterDemoModel({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 需要ScopedModelDescendant这个包装才能拿到model里面数据
    return ScopedModelDescendant<CounterModel>(
      rebuildOnChange: true, //数据发生变化时这个需要重建所以设置true
      builder: (context, _, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: () {
          model.increaseCount();
        },
      ),
    );
  }
}

// 数据model
class CounterModel extends Model {
  int _count = 10;
  int get count => _count;
  void increaseCount() {
    _count += 2;
    notifyListeners(); // 监听变化
  }
}
