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
              onPressed: () async {
                final result = await Navigator.of(context)
                    .push<PersonalInfo>(PersonalInfoFlow.route());
                if (result != null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text('Result: $result'),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}

@freezed
abstract class PersonalInfoFlowEvent with _$PersonalInfoFlowEvent {
  const factory PersonalInfoFlowEvent.name(String name) = _Name;
  const factory PersonalInfoFlowEvent.age(int age) = _Age;
  const factory PersonalInfoFlowEvent.weight(double weight) = _Weight;
}

@freezed
abstract class PersonalInfoFlowState with _$PersonalInfoFlowState {
  const factory PersonalInfoFlowState({
    String name,
    int age,
    double weight,
  }) = _State;
}

@freezed
abstract class PersonalInfo with _$PersonalInfo {
  const factory PersonalInfo(String name, int age, double weight) =
      _PersonalInfo;
}

class PersonalInfoFlow extends StatelessWidget {
  static Route<T> route<T>() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => PersonalInfoFlow(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Coordinator<PersonalInfoFlowEvent, PersonalInfoFlowState>(
      onNext: ({coordinator, after}) {
        after.when(
          name: (name) {
            coordinator.state = coordinator.state.copyWith(name: name);
            pushStepTwo(coordinator);
          },
          age: (age) {
            coordinator.state = coordinator.state.copyWith(age: age);
            pushStepThree(coordinator);
          },
          weight: (weight) {
            coordinator.state = coordinator.state.copyWith(weight: weight);
            coordinator.exit(PersonalInfo(
              coordinator.state.name,
              coordinator.state.age,
              coordinator.state.weight,
            ));
          },
        );
      },
      onStart: ({coordinator}) => pushStepOne(coordinator),
      initialState: PersonalInfoFlowState(),
      child: LoadingScreen(),
    );
  }

  Future<void> pushStepOne(CoordinatorState coordinator) async {
    // simulate some sort of async loading operation for effect
    await Future.delayed(Duration(seconds: 1));

    coordinator.replace(
      MaterialPageRoute(
        settings: RouteSettings(isInitialRoute: true),
        builder: (_) => StepOneScreen(),
      ),
    );
  }

  void pushStepTwo(CoordinatorState coordinator) {
    coordinator.push(
      MaterialPageRoute(
        builder: (_) => StepTwoScreen(),
      ),
    );
  }

  void pushStepThree(CoordinatorState coordinator) {
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
              after: PersonalInfoFlowEvent.name('Sam'),
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
                after: PersonalInfoFlowEvent.age(32),
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
                after: PersonalInfoFlowEvent.weight(140),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
