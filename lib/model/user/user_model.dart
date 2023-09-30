class UserMOdel{
  String? email;
  String?password;
  UserMOdel._();
  static final UserMOdel _instance = UserMOdel._();
  factory UserMOdel(){
  
return _instance;

  }
  String?validateEmail(){
    if(email==null||email==''){
       return 'Please Enter Email Address';
    }
    final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email!);
  if(!emailValid){
      return 'Invalid Email';
    }
    else{
      return null;
    }
  }
  String?validatePassword(){
    if(password==null||password==''){
      return 'Please Enter a Password';
    }else if (password!.length<6){
      return 'Password Must Contain 6 Character';
    }else{
      return null;
    }
  }
}