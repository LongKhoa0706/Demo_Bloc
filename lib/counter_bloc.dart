import 'dart:async';

import 'package:flutter_app/counterEvent.dart';

class CounterBLoc {
  int _counter = 0;
  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  // event exposing only a sink which is an input
  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBLoc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncreamentEvent)
      _counter++;
     else {
      _counter--;
      // important
      _inCounter.add(_counter);
    }
    void disapose() {
      _counterEventController.close();
      _counterStateController.close();
    }
  }
}
