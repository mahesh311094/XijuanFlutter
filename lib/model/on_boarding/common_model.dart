class CommonModel {
  String? userId;
  String? accessToken;
  String? refreshToken;
  String? responseMessage;
  bool? status;
  bool? isFirstTimeLogin;

  CommonModel({
    this.userId,
    this.accessToken,
    this.refreshToken,
    this.responseMessage,
    this.status,
    this.isFirstTimeLogin,
  });

  CommonModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    responseMessage = json['response_messsage'];
    status = json['status'];
    isFirstTimeLogin = json['is_first_time_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['response_messsage'] = responseMessage;
    data['status'] = status;
    data['is_first_time_login'] = isFirstTimeLogin;
    return data;
  }
}
