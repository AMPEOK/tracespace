class PostRegisterAccountPostReq {
  String? email;
  String? password;
  String? confirmPassword;

  PostRegisterAccountPostReq({this.email, this.password, this.confirmPassword});

  PostRegisterAccountPostReq.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    password = json['Password'];
    confirmPassword = json['ConfirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (email != null) {
      data['Email'] = email;
    }
    if (password != null) {
      data['Password'] = password;
    }
    if (confirmPassword != null) {
      data['ConfirmPassword'] = confirmPassword;
    }
    return data;
  }
}
