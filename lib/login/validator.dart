import 'dart:async';

class Validators{
  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains("@")){
        sink.add(email);
      }else{
        sink.addError("Email is not valid");
      }
    }
  );
  var passWordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length == 0 ){
        sink.addError("Password not empty");
      }else{
        sink.add(password);
      }
    }
  );
}