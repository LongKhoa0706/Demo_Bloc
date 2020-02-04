import 'dart:async';

import 'package:flutter_app/counter/counterEvent.dart';

class CounterBLoc {
  CounterBLoc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  /// StreamController của State.
  final _counterStateController = StreamController<int>();
  Stream<int> get counter => _counterStateController.stream;

  /// StreamController của Event.
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get event => _counterEventController.sink;

  /// State _counter.
  int _counter = 0;

  void _mapEventToState(CounterEvent event) {
    if (event is IncreamentEvent){
      _counter++;
      print('counter++');
    } else {
      _counter--;
      print('couter--');
    }

    // Sau khi xử lý thì đẩy dữ liệu mới ra UI.
    _counterStateController.add(_counter);
  }

  /// Hàm này phải để ngoài, khi nào cần đóng Bloc thì gọi nó.
  /// nó sẽ huỷ các StreamController đi.
  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}