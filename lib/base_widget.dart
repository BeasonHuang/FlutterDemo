import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//基础组件
class BaseWidget extends StatefulWidget {
  @override
  State<BaseWidget> createState() {
    return _BaseWidgetContentState();
  }
}

//基础组件内容
class _BaseWidgetContentState extends State<BaseWidget> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
      fontFamily: 'Raleway',
      fontSize: 22,
    );

    SizedBox buildSizedBox(var builderWidget) {
      return SizedBox.fromSize(
        child: builderWidget(),
        size: Size(double.infinity, 50),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text("BaseWidget")),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Hello Text",
                  textAlign: TextAlign.left,
                  style: textStyle,
                ),
                Text(
                  "Hello world! I'm Beason. " * 4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Hello world",
                  textScaleFactor: 1.5,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: "Home: "),
                  TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue),
                  ),
                ])),
                buildSizedBox(() {
                  return RaisedButton(
                    color: Colors.cyanAccent,
                    child: Text("RaisedButton"),
                    onPressed: () {},
                  );
                }),
                buildSizedBox(() {
                  return FlatButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("FlatButton"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  );
                }),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {},
                ),
                new Image.asset('images/default_avatar.png'),
                buildSizedBox(() {
                  return new Image.network(
                    "http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg",
                    width: 300,
                    repeat: ImageRepeat.repeatX,
                  );
                }),
                Switch(
                  value: _switchSelected,
                  activeColor: Colors.red, //
                  onChanged: (bool value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red, //
                  onChanged: (bool value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
                TextField(
                  maxLength: 5,
                  maxLengthEnforced: true,
                  autofocus: false,
                  onChanged: (v) => print(v),
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                //进度条显示50%
                LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
                // 圆形进度条直径指定为100
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    value: .7,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
