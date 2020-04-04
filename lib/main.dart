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
            onPressed: () => Navigator.of(context).push(DummyFlow.route()),
          ),
        ),
      ),
    );
  }
}

enum DummyFlowStep {
  stepOne,
  stepTwo,
  stepThree,
}

class DummyFlow extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => DummyFlow(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Coordinator<DummyFlowStep>(
      onNext: ({coordinator, after}) {
        switch (after) {
          case DummyFlowStep.stepOne:
            pushStepTwo(coordinator);
            break;
          case DummyFlowStep.stepTwo:
            pushStepThree(coordinator);
            break;
          case DummyFlowStep.stepThree:
            coordinator.exit();
            break;
        }
      },
      initial: StepOneScreen(),
    );
  }

  void pushStepTwo(CoordinatorState<DummyFlowStep> coordinator) {
    coordinator.push(
      MaterialPageRoute(
        builder: (_) => StepTwoScreen(),
      ),
    );
  }

  void pushStepThree(CoordinatorState<DummyFlowStep> coordinator) {
    coordinator.push(
      MaterialPageRoute(
        builder: (_) => StepThreeScreen(),
      ),
    );
  }
}

typedef NextCallback<T> = Function({CoordinatorState<T> coordinator, T after});

class Coordinator<T> extends StatefulWidget {
  final NextCallback<T> onNext;
  final Widget initial;

  const Coordinator({this.onNext, this.initial});

  static CoordinatorState<T> of<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedCoordinator>()
        .data;
  }

  @override
  CoordinatorState<T> createState() => CoordinatorState<T>();
}

class CoordinatorState<T> extends State<Coordinator<T>> {
  final routingEventController = StreamController<T>.broadcast();
  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => navigatorKey.currentState;

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
                widget.onNext(
                  coordinator: this,
                  after: data,
                );
              },
              child: widget.initial,
            ),
          );
        },
      ),
    );
  }

  void next({T after}) {
    routingEventController.add(after);
  }

  void exit() {
    Navigator.of(context).maybePop();
  }

  Future<T> push<T>(Route<T> route) {
    return navigator.push(route);
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
            onPressed: () =>
                Coordinator.of(context).next(after: DummyFlowStep.stepOne),
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
        // you can put this anywhere that you wanna be able to dismiss the
        // current flow
        actions: <Widget>[CoordinatorCloseButton()],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Continue'),
              onPressed: () =>
                  Coordinator.of(context).next(after: DummyFlowStep.stepTwo),
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
                  Coordinator.of(context).next(after: DummyFlowStep.stepThree),
            ),
          ),
        ),
      ),
    );
  }
}
