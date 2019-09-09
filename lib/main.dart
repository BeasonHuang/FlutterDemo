import 'package:flutter/material.dart';
import 'package:flutter_demo/error_route_widget.dart';
import 'package:flutter_demo/scroll_widget.dart';

import 'base_widget.dart';
import 'container_widget.dart';
import 'function_widget.dart';
import 'layout_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Map<String, WidgetBuilder> routes = {
    //基础组件
    "base_widget": (context) => BaseWidget(),
    //布局类
    "layout_widget": (context) => LayoutWidget(),
    //容器
    "container_widget": (context) => ContainerWidget(),
    //滚动
    "scroll_widget": (context) => ScrollWidget(),
    //功能型
    "fun_widget": (context) => FunctionWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        if (!routes.containsKey(settings)) {
          builder = (BuildContext context) => new ErrorRouteWidget();
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              buildRouteItem(context, "基础组件", "base_widget"),
              buildRouteItem(context, "布局类组件", "layout_widget"),
              buildRouteItem(context, "容器类组件", "container_widget"),
              buildRouteItem(context, "可滚动组件", "scroll_widget"),
              buildRouteItem(context, "功能型组件", "function_widget"),
              buildRouteItem(context, "事件处理", "event_widget"),
              buildRouteItem(context, "动画", "anim_widget"),
              buildRouteItem(context, "自定义组件", "custom_component_widget"),
              buildRouteItem(context, "文件与网络请求", "io_widget"),
            ],
          ),
        ),
      ),
    );
  }

  //构造每一个Item行
  SizedBox buildRouteItem(BuildContext context, String name, String routeStr) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton.icon(
        label: Text(name),
        onPressed: () {
          if (routeStr.isEmpty) {
          } else {
            Navigator.of(context).pushNamed(routeStr);
          }
        },
        icon: Icon(Icons.send),
      ),
    );
  }
}
