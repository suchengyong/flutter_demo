import 'package:flutter/material.dart';

class StateInheritedWidget extends StatefulWidget {
  StateInheritedWidget({Key key}) : super(key: key);

  @override
  _StateInheritedWidgetState createState() => _StateInheritedWidgetState();
}

class _StateInheritedWidgetState extends State<StateInheritedWidget> {
  int _count = 10;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 在这个组件包装下的组组件都可以 直接拿到他里面的值
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('状态管理'),
          elevation: 0.0,
        ),
        body: Center(child: CounterWrapper()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _increaseCount();
          },
        ),
      ),
    );
  }
}

// 中间组件
class CounterWrapper extends StatelessWidget {
  const CounterWrapper({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDemo(),
    );
  }
}

// 孙子组件
class CounterDemo extends StatelessWidget {
  const CounterDemo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return Container(
      child: ActionChip(
        label: Text('$count'),
        onPressed: () {
          // 子组件调用CounterProvider父组件方法
          increaseCount();
        },
      ),
    );
  }
}

// 数据modal
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
