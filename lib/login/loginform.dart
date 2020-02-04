import 'package:flutter/material.dart';
import 'package:flutter_app/login/bloc.dart';
import 'package:flutter_app/login/pagetwo.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Bloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Bloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (_, snapshot) => TextField(
                  onChanged: bloc.emailChange,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter email",
                    labelText: "Email",
                    errorText: snapshot.error,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder:(_, snapshot) => TextField(
                  onChanged: bloc.passwordChange,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter password",
                    labelText: "Password",
                    errorText: snapshot.error,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (_, snapshot) {
                  // nếu phần valid email và password không đúng thì disable button
                  // tham số onPressed là null thì button sẽ disabled.
                  return RaisedButton(
                    color: Colors.tealAccent,
                    onPressed: (snapshot.hasData && snapshot.data) ? changePage : null,
                    child: Text("Submit"),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changePage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => PageTwo()));
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
