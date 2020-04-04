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

typedef NextCallback = void Function({Step after});

class Coordinator extends StatefulWidget {
  static const String routeNameKey = 'coordinator123';

  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: RouteSettings(name: Coordinator.routeNameKey),
      builder: (_) => Coordinator(),
    );
  }

  String get routeName => routeNameKey;

  const Coordinator();

  @override
  _CoordinatorState createState() => _CoordinatorState();
}

class _CoordinatorState extends State<Coordinator> {
  final routingEventController = StreamController<Step>.broadcast();

  @override
  void dispose() {
    routingEventController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamListener(
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
      child: StepOneScreen(next),
    );
  }

  void next({Step after}) {
    routingEventController.add(after);
  }

  void exit() {
    Navigator.of(context)
        .popUntil((route) => route.settings.name == widget.routeName);
  }

  void pushStepTwo() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StepTwoScreen(next),
      ),
    );
  }

  void pushStepThree() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StepThreeScreen(next),
      ),
    );
  }
}

class StepOneScreen extends StatelessWidget {
  final NextCallback next;

  const StepOneScreen(this.next);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step one'),
      ),
      body: SafeArea(
        child: Center(
          child: OutlineButton(
            child: Text('Continue'),
            onPressed: () => next(after: Step.stepOne),
          ),
        ),
      ),
    );
  }
}

class StepTwoScreen extends StatelessWidget {
  final NextCallback next;

  const StepTwoScreen(this.next);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step two'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Continue'),
              onPressed: () => next(after: Step.stepTwo),
            ),
          ),
        ),
      ),
    );
  }
}

class StepThreeScreen extends StatelessWidget {
  final NextCallback next;

  const StepThreeScreen(this.next);

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
              onPressed: () => next(after: Step.stepThree),
            ),
          ),
        ),
      ),
    );
  }
}
