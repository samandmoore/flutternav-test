import 'package:flutter/material.dart';
import 'package:flutternav/coordinator.dart';

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
