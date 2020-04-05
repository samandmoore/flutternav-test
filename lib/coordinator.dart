import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stream_listener/flutter_stream_listener.dart';

typedef NextCallback<T> = void Function(
    {CoordinatorState<T> coordinator, T after});
typedef StartCallback<T> = void Function({CoordinatorState<T> coordinator});

class Coordinator<T> extends StatefulWidget {
  final NextCallback<T> onNext;
  final StartCallback<T> onStart;
  final Widget child;

  const Coordinator({this.onNext, this.child, this.onStart});

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
      child: StreamListener(
        stream: routingEventController.stream,
        onData: (data) {
          widget.onNext(
            coordinator: this,
            after: data,
          );
        },
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: RouteSettings(isInitialRoute: true),
              builder: (context) => CoordinatorStart(
                onStart: widget.onStart,
                child: widget.child,
              ),
            );
          },
        ),
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

  Future<T> replace<T>(Route<T> route) {
    return navigator.pushReplacement(route);
  }
}

class CoordinatorStart<T> extends StatefulWidget {
  final Widget child;
  final StartCallback<T> onStart;

  CoordinatorStart({this.child, this.onStart});

  @override
  _CoordinatorStartState<T> createState() => _CoordinatorStartState<T>();
}

class _CoordinatorStartState<T> extends State<CoordinatorStart<T>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.onStart(coordinator: Coordinator.of<T>(context)),
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
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
