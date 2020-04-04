import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stream_listener/flutter_stream_listener.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Center(
          child: OutlineButton(
            child: Text('Start'),
            onPressed: () => Navigator.of(context).push(Coordinator.route()),
          ),
        ),
      ),
    );
  }
}

enum Step {
  stepOne,
  stepTwo,
  stepThree,
}

class Coordinator extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => Coordinator(),
    );
  }

  const Coordinator();

  static CoordinatorState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedCoordinator>()
        .data;
  }

  @override
  CoordinatorState createState() => CoordinatorState();
}

class CoordinatorState extends State<Coordinator> {
  final routingEventController = StreamController<Step>.broadcast();
  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get coordinatorNavigator => navigatorKey.currentState;

  @override
  void dispose() {
    routingEventController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCoordinator(
      data: this,
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: RouteSettings(isInitialRoute: true),
            builder: (context) => StreamListener(
              stream: routingEventController.stream,
              onData: (data) {
                switch (data) {
                  case Step.stepOne:
                    pushStepTwo();
                    break;
                  case Step.stepTwo:
                    pushStepThree();
                    break;
                  case Step.stepThree:
                    exit();
                    break;
                }
              },
              child: StepOneScreen(),
            ),
          );
        },
      ),
    );
  }

  void next({Step after}) {
    routingEventController.add(after);
  }

  void exit() {
    Navigator.of(context).maybePop();
  }

  void pushStepTwo() {
    coordinatorNavigator.push(
      MaterialPageRoute(
        builder: (_) => StepTwoScreen(),
      ),
    );
  }

  void pushStepThree() {
    coordinatorNavigator.push(
      MaterialPageRoute(
        builder: (_) => StepThreeScreen(),
      ),
    );
  }
}

class _InheritedCoordinator extends InheritedWidget {
  final CoordinatorState data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  _InheritedCoordinator({
    Key key,
    Widget child,
    this.data,
  }) : super(key: key, child: child);
}

class CoordinatorCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onPressed: () {
        Coordinator.of(context).exit();
      },
    );
  }
}

class StepOneScreen extends StatelessWidget {
  const StepOneScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step one'),
        actions: <Widget>[CoordinatorCloseButton()],
      ),
      body: SafeArea(
        child: Center(
          child: OutlineButton(
            child: Text('Continue'),
            onPressed: () => Coordinator.of(context).next(after: Step.stepOne),
          ),
        ),
      ),
    );
  }
}

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step two'),
        actions: <Widget>[CoordinatorCloseButton()],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Continue'),
              onPressed: () =>
                  Coordinator.of(context).next(after: Step.stepTwo),
            ),
          ),
        ),
      ),
    );
  }
}

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step three'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Exit'),
              onPressed: () =>
                  Coordinator.of(context).next(after: Step.stepThree),
            ),
          ),
        ),
      ),
    );
  }
}
