import 'package:flutter/material.dart';

class PostShowPage extends StatelessWidget {
  final Map arguments;

  PostShowPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${arguments['title']}'),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(arguments['imageUrl']),
              Container(
                padding: EdgeInsets.all(32.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${arguments['title']}',
                        // 设置文字的样式
                        style: Theme.of(context).textTheme.title),
                    Text('${arguments['author']}',
                        style: Theme.of(context).textTheme.subhead),
                    SizedBox(height: 32.0),
                    Text('${arguments['description']}',
                        style: Theme.of(context).textTheme.body1),
                    SizedBox(height: 32.0),
                    Text('${arguments['data'].title}',
                        style: Theme.of(context).textTheme.body1),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
