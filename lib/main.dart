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
abstract class PersonalInfoFlowStep with _$PersonalInfoFlowStep {
  const factory PersonalInfoFlowStep.name(String name) = _Name;
  const factory PersonalInfoFlowStep.age(int age) = _Age;
  const factory PersonalInfoFlowStep.weight(double weight) = _Weight;
}

@freezed
abstract class PersonalInfoFlowData with _$PersonalInfoFlowData {
  const factory PersonalInfoFlowData({
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
    return Coordinator<PersonalInfoFlowStep, PersonalInfoFlowData>(
      onNext: ({coordinator, after}) {
        after.when(
          name: (name) {
            coordinator.data = coordinator.data.copyWith(name: name);
            pushAgeStep(coordinator);
          },
          age: (age) {
            coordinator.data = coordinator.data.copyWith(age: age);
            pushWeightStep(coordinator);
          },
          weight: (weight) {
            coordinator.data = coordinator.data.copyWith(weight: weight);
            coordinator.exit(PersonalInfo(
              coordinator.data.name,
              coordinator.data.age,
              coordinator.data.weight,
            ));
          },
        );
      },
      onStart: ({coordinator}) => pushNameStep(coordinator),
      initialData: PersonalInfoFlowData(),
      child: LoadingScreen(),
    );
  }

  Future<void> pushNameStep(CoordinatorState coordinator) async {
    // simulate some sort of async loading operation for effect
    await Future.delayed(Duration(seconds: 1));

    coordinator.replace(
      MaterialPageRoute(
        settings: RouteSettings(isInitialRoute: true),
        builder: (_) => NameScreen(),
      ),
    );
  }

  Future<void> pushAgeStep(CoordinatorState coordinator) async {
    final result = await coordinator.push(SomethingSubflow.route());
    if (result != null) {
      coordinator.push(
        MaterialPageRoute(
          builder: (_) => AgeScreen(),
        ),
      );
    }
  }

  void pushWeightStep(CoordinatorState coordinator) {
    coordinator.push(
      MaterialPageRoute(
        builder: (_) => WeightScreen(),
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

class NameScreen extends StatelessWidget {
  const NameScreen();

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
              after: PersonalInfoFlowStep.name('Sam'),
            ),
          ),
        ),
      ),
    );
  }
}

class AgeScreen extends StatelessWidget {
  const AgeScreen();

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
                after: PersonalInfoFlowStep.age(32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WeightScreen extends StatelessWidget {
  const WeightScreen();

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
                after: PersonalInfoFlowStep.weight(140),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SomethingSubflow extends StatelessWidget {
  static Route<String> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => SomethingSubflow(),
    );
  }

  const SomethingSubflow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Coordinator<String, int>(
      initialData: 0,
      onNext: ({after, coordinator}) {
        if (after == "first") {
          coordinator
              .push(MaterialPageRoute(builder: (_) => SubflowStepTwoScreen()));
        } else {
          coordinator.exit("something");
        }
      },
      child: SubflowStepOneScreen(),
    );
  }
}

class SubflowStepOneScreen extends StatelessWidget {
  const SubflowStepOneScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subflow: Step one'),
        actions: <Widget>[CoordinatorCloseButton()],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Next'),
              onPressed: () => Coordinator.of(context).next(
                after: "first",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubflowStepTwoScreen extends StatelessWidget {
  const SubflowStepTwoScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subflow: Step two'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Exit'),
              onPressed: () => Coordinator.of(context).next(
                after: "last",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
