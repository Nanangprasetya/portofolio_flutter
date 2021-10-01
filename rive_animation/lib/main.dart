import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum RiveState { success, loading, error }

class _MyHomePageState extends State<MyHomePage> {
  Artboard _riveArtboard;
  RiveAnimationController _controller;

  _loadRive(RiveState state) {
    print("Press me");

    rootBundle.load('assets/rive_loading.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final Artboard artboard = file.mainArtboard;

          _conditionArtboard(artboard, state);
        }
      },
    );
  }

  _conditionArtboard(Artboard artboard, RiveState state) {
    switch (state) {
      case RiveState.loading:
        artboard.addController(_controller = SimpleAnimation('loading'));
        break;
      case RiveState.success:
        artboard.addController(_controller = SimpleAnimation('success'));
        break;
      case RiveState.error:
        artboard.addController(_controller = SimpleAnimation('error'));
        break;
    }
    setState(() => _riveArtboard = artboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rive Animation | v6.3"),
        actions: [
          IconButton(icon: Icon(Icons.info_outline), onPressed: null)
        ],
      ),
      body: Center(
        child: _riveArtboard == null
            ? Text("Please press the button at the bottom!")
            : Rive(artboard: _riveArtboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              onPressed: () => _loadRive(RiveState.loading),
              child: Icon(Icons.replay_rounded)),
          SizedBox(width: 20),
          FloatingActionButton(
              onPressed: () => _loadRive(RiveState.success),
              child: Icon(Icons.check)),
          SizedBox(width: 20),
          FloatingActionButton(
              onPressed: () => _loadRive(RiveState.error),
              child: Icon(
                Icons.error_outline,
              )),
        ],
      ),
    );
  }
}
