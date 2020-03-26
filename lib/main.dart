import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WillPopScope(
        onWillPop: () async {
          print('do not pop!');
          return false;
        },
        child: MoScreen(),
      ),
    );
  }
}

class MoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  body: SafeArea(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Mo'),
                          OutlineButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (_) => LarryScreen()),
                                (route) => false,
                              );
                            },
                            child: Text('Go'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          default:
            throw UnimplementedError();
        }
      },
    );
  }
}

class LarryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Larry'),
              OutlineButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
