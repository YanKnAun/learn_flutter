import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      // home: const MyHomePage(title: 'Flutter Home Page'),
      // home: const ContextRoute(),
      // home: const Echo(text: 'Flutter Echo Text'),
      // home: const ParentWidget(),
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Home Page'),
        'echo': (context) => const Echo(text: 'Flutter Echo Text')
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Wy have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("echo", arguments: "Yanzy");
                },
                child: const Text("router Text"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.access_alarm),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.grey, //???????????????
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments ?? 'Pap';
    print(args);

    return Center(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Text(text),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Text("aa"))
          ],
        ),
      ),
    );
  }
}

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({Key? key}) : super(key: key);

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget"),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  // ?????????????????????Scaffold?????????ScaffoldState??????
                  ScaffoldState _state =
                      context.findAncestorStateOfType<ScaffoldState>()!;
                  // ??????????????????
                  _state.openDrawer();
                },
                child: const Text('??????????????????1'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  // ????????????of?????????????????????ScaffoldState
                  ScaffoldState _state = Scaffold.of(context);
                  // ??????????????????
                  _state.openDrawer();
                },
                child: const Text('??????????????????2'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("I'm SnackBar")),
                    );
                  },
                  child: const Text("SnackBar"));
            })
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

class TabA extends StatefulWidget {
  const TabA({Key? key}) : super(key: key);

  @override
  _TabAState createState() => _TabAState();
}

// ???????????????????????????
class _TabAState extends State<TabA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void handleChangeActive(bool active) {
    setState(() {
      _active = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return TapBoxB(
    //   active: _active,
    //   onChanged: handleChangeActive,
    // );
    return TapBoxC(
      active: _active,
      onChanged: handleChangeActive,
    );
  }
}

// ??????????????????????????????
class TapBoxB extends StatelessWidget {
  const TapBoxB({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightBlue[700] : Colors.yellow[600],
        ),
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {
  const TapBoxC({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  final bool active;

  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

// ????????????
class _TapBoxCState extends State<TapBoxC> {
  bool _highlightBorder = true;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlightBorder = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlightBorder = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlightBorder = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const GetStateObjectRoute();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown, // ??????????????????
      onTapUp: _handleTapUp, // ??????????????????
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'ActiveC' : 'InactiveC',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightBlue[700] : Colors.yellow[600],
          border: _highlightBorder
              ? Border.all(
                  color: Colors.white,
                  width: 40.0,
                )
              : null,
        ),
      ),
    );
  }
}
