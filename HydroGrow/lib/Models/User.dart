class User {
  int systemID;
  String password;
  String email;
  String name;
  String userName;

  User({this.systemID, this.password, this.email, this.name, this.userName});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        systemID: json['systemID'],
        password: json['password'],
        email: json['email'],
        name: json['name'],
        userName: json['username']);
  }
}
