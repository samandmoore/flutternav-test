import 'dart:async';

import 'package:flutter/material.dart';

typedef NextCallback<TStep, TData> = void Function({
  CoordinatorState<TStep, TData> coordinator,
  TStep after,
});

typedef StartCallback<TStep, TData> = void Function({
  CoordinatorState<TStep, TData> coordinator,
});

class Coordinator<TStep, TData> extends StatefulWidget {
  final TData initialData;
  final NextCallback<TStep, TData> onNext;
  final StartCallback<TStep, TData> onStart;
  final Widget child;

  const Coordinator({
    this.onNext,
    this.child,
    this.onStart,
    @required this.initialData,
  }) : assert(initialData != null);

  static CoordinatorState<TStep, TData> of<TStep, TData>(
    BuildContext context,
  ) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedCoordinator>().data;
  }

  @override
  CoordinatorState<TStep, TData> createState() => CoordinatorState<TStep, TData>();
}

class CoordinatorState<TStep, TData> extends State<Coordinator<TStep, TData>> {
  final navigatorKey = GlobalKey<NavigatorState>();

  TData data;

  NavigatorState get navigator => navigatorKey.currentState;

  @override
  void initState() {
    super.initState();
    data = widget.initialData;
  }

  @override
  void dispose() {
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
            settings: const RouteSettings(isInitialRoute: true),
            builder: (context) => _CoordinatorStart(
              onStart: widget.onStart,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }

  void next({@required TStep after}) {
    widget.onNext(coordinator: this, after: after);
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

class _CoordinatorStart<TStep, TData> extends StatefulWidget {
  final Widget child;
  final StartCallback<TStep, TData> onStart;

  const _CoordinatorStart({this.child, this.onStart});

  @override
  _CoordinatorStartState<TStep, TData> createState() => _CoordinatorStartState<TStep, TData>();
}

class _CoordinatorStartState<TStep, TData> extends State<_CoordinatorStart<TStep, TData>> {
  @override
  void initState() {
    super.initState();
    if (widget.onStart != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onStart(
          coordinator: Coordinator.of<TStep, TData>(context),
        );
      });
    }
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

  const _InheritedCoordinator({
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
