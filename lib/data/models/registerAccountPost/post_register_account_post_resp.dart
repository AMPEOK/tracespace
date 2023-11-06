class PostRegisterAccountPostResp {
  String? message;
  ModelState? modelState;

  PostRegisterAccountPostResp({this.message, this.modelState});

  PostRegisterAccountPostResp.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    modelState = json['ModelState'] != null
        ? ModelState.fromJson(json['ModelState'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (message != null) {
      data['Message'] = message;
    }
    if (modelState != null) {
      data['ModelState'] = modelState?.toJson();
    }
    return data;
  }
}

class ModelState {
  List<String>? voidChar;

  ModelState({this.voidChar});

  ModelState.fromJson(Map<String, dynamic> json) {
    voidChar = json[''].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (voidChar != null) {
      data[''] = voidChar;
    }
    return data;
  }
}
