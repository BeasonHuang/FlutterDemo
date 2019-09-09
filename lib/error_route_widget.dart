import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ErrorContentPage();
  }
}

class ErrorContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route error"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
        //容器外填充
        constraints: BoxConstraints.tightFor(
            width: double.infinity, height: double.infinity),
        //卡片大小
        decoration: BoxDecoration(
            //背景装饰
            gradient: RadialGradient(
                //背景径向渐变
                colors: [Colors.white, Colors.orange],
                center: Alignment.topLeft,
                radius: .98),
            boxShadow: [
              //卡片阴影
              BoxShadow(color: Colors.transparent, blurRadius: 4.0)
            ]),
        //卡片倾斜变换
        alignment: Alignment.center,
        //卡片内文字居中
        child: Text(
          //卡片文字
          "访问路由出错", style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
}
