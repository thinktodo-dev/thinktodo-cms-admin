class ApiResponse {
  int? code;
  int? statusCode;
  dynamic error;
  dynamic message;
  dynamic data;

  ApiResponse(
      {required this.code,
      required this.statusCode,
      required this.error,
      required this.message,
      this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      statusCode: json['statusCode'],
      error: json['error'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['statusCode'] = statusCode;
    data['error'] = error;
    data['message'] =message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

  bool isSuccess() {
    return code == 1;
  }
}
