import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/login/validator.dart';

class Bloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passWordController = BehaviorSubject<String>();

  Function get emailChange => _emailController.sink.add;
  Function  get passwordChange => _passWordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passWordController.stream.transform(passWordValidator);

  Stream<bool> get submitCheck => Rx.combineLatest2(email, password, (e,p)=>true);

//  Stream<String> get emailStream=>_emailController.stream.transform();

  submit(){

  }

  dispose(){
    _emailController.close();
    _passWordController.close();
  }
}