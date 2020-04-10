import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stream_listener/flutter_stream_listener.dart';

typedef NextCallback<TEvent, TState> = void Function({
  CoordinatorState<TEvent, TState> coordinator,
  TEvent after,
});

typedef StartCallback<TEvent, TState> = void Function({
  CoordinatorState<TEvent, TState> coordinator,
});

class Coordinator<TEvent, TState> extends StatefulWidget {
  final TState initialState;
  final NextCallback<TEvent, TState> onNext;
  final StartCallback<TEvent, TState> onStart;
  final Widget child;

  Coordinator({
    this.onNext,
    this.child,
    this.onStart,
    @required this.initialState,
  }) : assert(initialState != null);

  static CoordinatorState<TEvent, TState> of<TEvent, TState>(
    BuildContext context,
  ) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedCoordinator>()
        .data;
  }

  @override
  CoordinatorState<TEvent, TState> createState() =>
      CoordinatorState<TEvent, TState>();
}

class CoordinatorState<TEvent, TState>
    extends State<Coordinator<TEvent, TState>> {
  final routingEventController = StreamController<TEvent>.broadcast();
  final navigatorKey = GlobalKey<NavigatorState>();

  TState state;

  NavigatorState get navigator => navigatorKey.currentState;

  @override
  void initState() {
    super.initState();
    state = widget.initialState;
  }

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
              builder: (context) => _CoordinatorStart(
                onStart: widget.onStart,
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }

  void next({@required TEvent after}) {
    routingEventController.add(after);
  }

  void exit<T>([T result]) {
    Navigator.of(context).maybePop(result);
  }

  Future<T> push<T>(Route<T> route) {
    return navigator.push(route);
  }

  Future<T> replace<T>(Route<T> route) {
    return navigator.pushReplacement(route);
  }
}

class _CoordinatorStart<TEvent, TState> extends StatefulWidget {
  final Widget child;
  final StartCallback<TEvent, TState> onStart;

  _CoordinatorStart({this.child, this.onStart});

  @override
  _CoordinatorStartState<TEvent, TState> createState() =>
      _CoordinatorStartState<TEvent, TState>();
}

class _CoordinatorStartState<TEvent, TState>
    extends State<_CoordinatorStart<TEvent, TState>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.onStart(
        coordinator: Coordinator.of<TEvent, TState>(context),
      ),
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
