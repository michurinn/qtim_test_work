class Urls {
  static const String login = '/api/core/auth/login';
  static const String logout = '/api/core/auth/logout';
  static const String refresh = '/api/core/auth/refresh';

  static const String scanQr = '/api/accreditation/qr/scan';

  /// remove 'printer/ for local usage :))
  static const String desk = '/printer/desks';

  static List<String> urlsWithoutAuth = [
    login,
  ];
}

String getDesksPath(int id) => '${Urls.desk}/$id/sse';

String getQrPath(int id) => '${Urls.desk}/$id/sse/event';

String getSkudQrPath(String eventName, String id) =>
    '/printer/users/$eventName/$id';

String sendSSeStatusUrl(int id) => '${Urls.desk}/$id/sse/mobile';

/// String getBadgeIdAfterScanningUrl(int id) => '/// PUT REAL URL HERE ///';
/// '/printer/desks/$id/sse';