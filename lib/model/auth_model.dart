class AuthModel{
   String? username;
   String? password;

  AuthModel({this.username,this.password});

  AuthModel.fromJson(Map<String,dynamic> json){
      username =  json['username'];
      password = json['password'];
  }

  Map<String,dynamic> toJson() => {
    "username" : username,
    "password" : password
  };
}