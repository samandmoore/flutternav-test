import 'package:flutter/material.dart';

const Object _dummy = Object();

class SignupValues {
  final String email;
  final String password;
  final String name;

  const SignupValues({this.email, this.password, this.name});

  SignupValues copyWith({
    Object email = _dummy,
    Object password = _dummy,
    Object name = _dummy,
  }) {
    return SignupValues(
      email: email == _dummy ? this.email : email,
      password: password == _dummy ? this.password : password,
      name: name == _dummy ? this.name : name,
    );
  }
}

class SignupResult {
  final String email;
  final String password;
  final String name;

  const SignupResult({this.email, this.password, this.name});
}

class Step<T> {
  final String name;
  final Route Function(
    T data,
    void Function(T newData) saveData,
    void Function() next,
  ) routeBuilder;
  final Action Function(T data) onNext;

  const Step({
    @required this.name,
    @required this.routeBuilder,
    @required this.onNext,
  });
}

abstract class Action {}

class Next implements Action {
  final String stepName;

  const Next(this.stepName);
}

class Exit<T> implements Action {
  final T value;

  const Exit(this.value);
}

class Coordinator<T> {
  T data;
  final List<Step<T>> steps;

  Coordinator({this.data, this.steps});

  void start() async {
    _processStep(steps[0]);
  }

  void _processStep(Step<T> step) {
    final route = step.routeBuilder(
      data,
      (T newData) => data = newData,
      () {
        final result = step.onNext(data);
        if (result is Next) {
          final nextStep = steps.singleWhere(
              (element) => element.name == result.stepName,
              orElse: () => throw Exception());
          _processStep(nextStep);
        } else if (result is Exit) {
          _parentNavigator.pop(result.value);
        }
      },
    );
    _navigator.push(route);
  }

  NavigatorState _navigator;
  NavigatorState _parentNavigator;
}

final flow = Coordinator<SignupValues>(
  data: SignupValues(),
  steps: [
    Step(
      name: 'email',
      routeBuilder: (data, saveData, next) {
        return MaterialPageRoute(
          builder: (_) => EmailScreen(
            onContinue: (email) {
              saveData(data.copyWith(email: email));
              next();
            },
          ),
        );
      },
      onNext: (data) => Next('password'),
    ),
    Step(
      name: 'password',
      routeBuilder: (data, saveData, next) {
        return MaterialPageRoute(
          builder: (_) => PasswordScreen(
            onContinue: (password) {
              saveData(data.copyWith(password: password));
              next();
            },
          ),
        );
      },
      onNext: (data) => Next('confirm'),
    ),
    Step(
      name: 'confirm',
      routeBuilder: (data, saveData, next) {
        return MaterialPageRoute(
          builder: (_) => ConfirmScreen(values: data, onContinue: next),
        );
      },
      onNext: (data) => Exit(
        SignupResult(
          email: data.email,
          password: data.password,
          name: data.name,
        ),
      ),
    ),
  ],
);

class EmailScreen extends StatelessWidget {
  final ValueChanged<String> onContinue;

  const EmailScreen({Key key, @required this.onContinue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Next'),
              onPressed: () => onContinue('test@example.org'),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordScreen extends StatelessWidget {
  final ValueChanged<String> onContinue;

  const PasswordScreen({Key key, @required this.onContinue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: OutlineButton(
              child: Text('Next'),
              onPressed: () => onContinue('correct-horse-battery-staple'),
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmScreen extends StatelessWidget {
  final SignupValues values;
  final VoidCallback onContinue;

  const ConfirmScreen({
    Key key,
    @required this.values,
    @required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(values.email),
              Text(values.password),
              Text(values.name),
              Container(
                child: OutlineButton(
                  child: Text('Next'),
                  onPressed: () => onContinue(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
