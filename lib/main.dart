import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutternav/coordinator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';

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

@freezed
abstract class DummyFlowEvent with _$DummyFlowEvent {
  const factory DummyFlowEvent.stepOne(String name) = _StepOne;
  const factory DummyFlowEvent.stepTwo(int age) = _StepTwo;
  const factory DummyFlowEvent.stepThree(double weight) = _StepThree;
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
    return Coordinator<DummyFlowEvent>(
      onNext: ({coordinator, after}) {
        after.when(
          stepOne: (name) => pushStepTwo(coordinator),
          stepTwo: (age) => pushStepThree(coordinator),
          stepThree: (weight) => coordinator.exit(),
        );
      },
      onStart: ({coordinator}) => pushStepOne(coordinator),
      child: LoadingScreen(),
    );
  }

  Future<void> pushStepOne(CoordinatorState<DummyFlowEvent> coordinator) async {
    // simulate some sort of async loading operation for effect
    await Future.delayed(Duration(seconds: 2));

    coordinator.replace(
      MaterialPageRoute(
        settings: RouteSettings(isInitialRoute: true),
        builder: (_) => StepOneScreen(),
      ),
    );
  }

  void pushStepTwo(CoordinatorState<DummyFlowEvent> coordinator) {
    coordinator.push(
      MaterialPageRoute(
        builder: (_) => StepTwoScreen(),
      ),
    );
  }

  void pushStepThree(CoordinatorState<DummyFlowEvent> coordinator) {
    coordinator.push(
      MaterialPageRoute(
        builder: (_) => StepThreeScreen(),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
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
            onPressed: () => Coordinator.of(context).next(
              after: DummyFlowEvent.stepOne('Sam'),
            ),
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
              onPressed: () => Coordinator.of(context).next(
                after: DummyFlowEvent.stepTwo(32),
              ),
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
              onPressed: () => Coordinator.of(context).next(
                after: DummyFlowEvent.stepThree(140),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
