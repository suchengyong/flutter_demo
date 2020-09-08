import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoginBox.dart';
import 'LoginProviderMainPage.dart';

class LoginBackgroundAnimationPage extends StatelessWidget {
  const LoginBackgroundAnimationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProviderMainPage()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Stack(
            fit: StackFit.expand, // 拉伸
            children: [
              BackgroundSlidMain(),
              BackgroundSlidMainToChange(),
              Positioned(
                left: 0,
                top: 250 * rpx,
                child: LoginBox(),
              ),
              Positioned(
                bottom: 230 * rpx,
                left: 0,
                child: Container(
                  width: 750 * rpx,
                  padding: EdgeInsets.symmetric(horizontal: 40 * rpx),
                  child: Divider(color: Colors.blueGrey),
                ),
              ),
              Positioned(
                bottom: 100 * rpx,
                left: 0,
                child: Container(
                  width: 750 * rpx,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.face,
                        size: 100 * rpx,
                        color: Colors.white70,
                      ),
                      Icon(
                        Icons.face,
                        size: 100 * rpx,
                        color: Colors.white70,
                      ),
                      Icon(
                        Icons.face,
                        size: 100 * rpx,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 背景幻灯片主图
class BackgroundSlidMain extends StatelessWidget {
  const BackgroundSlidMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProviderMainPage>(context, listen: true);
    return Opacity(
      opacity: provider.opacityMain,
      child: Image.asset(
        provider.imgList[provider.index],
        fit: BoxFit.cover,
      ),
    );
  }
}

// 被替换的背景幻灯片
class BackgroundSlidMainToChange extends StatelessWidget {
  const BackgroundSlidMainToChange({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProviderMainPage>(context, listen: true);
    return Opacity(
      opacity: provider.opacityToChange,
      child: Image.asset(
        provider.imgList[provider.indexChange],
        fit: BoxFit.cover,
      ),
    );
  }
}
