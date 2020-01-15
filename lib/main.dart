import 'package:flutter/material.dart';
import 'package:flutter_app/counterEvent.dart';
import 'package:flutter_app/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final bloc = CounterBLoc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Bloc',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo BLoc"),
        ),
        body: StreamBuilder<Object>(
          stream: bloc.counter,
          initialData: 0,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Number ${snapshot.data} ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 22),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("Increament"),
                          onPressed:()=> bloc.counterEventSink.add(IncreamentEvent()),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: RaisedButton(
                          child: Text("Decreament"),
                          onPressed: ()=>bloc.counterEventSink.add(DecreamentEvent()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }


}
