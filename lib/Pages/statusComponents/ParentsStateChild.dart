import 'package:flutter/material.dart';

class StateDemoPage extends StatefulWidget {
  StateDemoPage({Key key}) : super(key: key);

  @override
  _StateDemoPageState createState() => _StateDemoPageState();
}

class _StateDemoPageState extends State<StateDemoPage> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
        elevation: 0.0,
      ),
      body: Center(child: Counter(_count, _increaseCount)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _increaseCount();
        },
      ),
    );
  }
}

/// 子组件
class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;
  const Counter(this.count, this.increaseCount, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ActionChip(
        label: Text('$count'),
        onPressed: () {
          // 子组件调用父组件方法
          increaseCount();
        },
      ),
    );
  }
}
