class User {
  int? id;
  String? name;
  String? image;
  String? adresse;
  String? tel;
  String? email;
  String? token;
  

  User({this.id, this.name,this.image, this.adresse, this.tel, this.email, this.token});

  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        name: json['user']['name'],
        image: json['user']['image'],
        adresse: json['user']['adresse'],
        tel: json['user']['tel'],
        email: json['user']['email'],
        token: json['token']);
  }
}
