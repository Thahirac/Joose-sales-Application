enum EndPoints {
  login,
  forgotpass,
  resetpass,
  purchasedtls,
  redeemdtls,
}

class APIEndPoints {
  static String baseUrl = "https://";
  static String urlString(EndPoints endPoint) {
    return baseUrl + endPoint.endPointString;
  }
}

extension EndPointsExtension on EndPoints {
  // ignore: missing_return
  String get endPointString {
    switch (this) {
      case EndPoints.login:
        return "sales-login";
      case EndPoints.forgotpass:
        return "sales-forgot-password";
      case EndPoints.resetpass:
        return "sales-reset-password";
      case EndPoints.purchasedtls:
        return "purchase-Success";
      case EndPoints.redeemdtls:
        return "redeem-Success";
    }
  }
}
