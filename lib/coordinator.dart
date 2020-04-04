import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stream_listener/flutter_stream_listener.dart';

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
