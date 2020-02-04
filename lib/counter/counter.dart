import 'package:flutter/material.dart';

import 'counterEvent.dart';
import 'counter_bloc.dart';

class Counter extends StatefulWidget {

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  CounterBLoc bloc;
  /// Hàm này chỉ chạy một lần duy nhất khi Widget được tạo
  /// và thêm nó vào cây Widget lần đầu tiên
  /// Nên tạo Bloc trong hàm này
  @override
  void initState() {
    super.initState();
    /// Nếu khởi tạo Bloc tại đây.
    bloc = CounterBLoc();
    print('a');
  }

  /// Hàm này sẽ chạy khi Widget được xoá khỏi cây Widget.
  /// Ví dụ em đóng màn hình này lại thì hàm này sẽ chạy
  @override
  void dispose() {
    // Khi tắt screen thì đóng các StreamController trong Bloc lại.
    bloc.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo BLoc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// Chổ này nên để rõ mình sẽ nhận dc giữ liệu gì
            StreamBuilder<int>(
                initialData: 0,
                stream: bloc.counter,
                builder: (context, snapshot) {
                  // Chỉ nên wrap thằng này thôi, vì mỗi lần nhận dc dữ liệu mới
                  // nó sẽ chạy hàm builder này và tạo lại Widget Text với dữ liệu mới
                  // nhét thêm Widget khác có thể được, nhưng không nên
                  // vì sẽ khiến ứng dụng chậm đi, vì phải tạo thêm các Widget khác
                  return Text(
                    "Number ${snapshot.data}",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  );
                }
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("Increament"),
                    onPressed:() => bloc.event.add(IncreamentEvent()),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: RaisedButton(
                    child: Text("Decreament"),
                    onPressed: () => bloc.event.add(DecreamentEvent()),
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: Text("Practise 2 "),
              onPressed:() {
                Navigator.pushNamed(context,'practise2');
              },
            ),
          ],
        ),
      ),
    );
  }
}
