// import 'dart:async';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:expo_id/app/network/Urls.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_prefs_cookie_store/shared_prefs_cookie_store.dart';

// class External {
//   static final _instance = External._();

//   factory External() => _instance;

//   External._() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: Urls.baseUrl,
//         responseType: ResponseType.json,
//         receiveTimeout: const Duration(milliseconds: 1500),
//         sendTimeout: const Duration(milliseconds: 3000),
//       ),
//     )
//       ..interceptors.add(InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           log(
//             options.path,
//             name: 'onRequest',
//           );
//           return handler.next(options);
//         },
//         onError: (e, handler) {
//           log(
//             'intercepted error',
//             name: 'e path: ${e.response?.realUri}',
//             error: e.response?.data,
//           );
//           return handler.reject(e);
//         },
//         onResponse: (e, handler) async {
//           log(
//             ''
//             '\ndata: ${e.data}'
//             '\ncode: ${e.statusCode}'
//             '\nmessage:${e.statusMessage}'
//             '\nheaders:${e.headers}',
//             name: 'resp path: ${e.realUri}',
//           );
//           if (e.statusCode == 401 && e.statusMessage != 'Una') {
//             await dio.post(
//               Urls.refresh,
//               data: {},
//             );
//           }
//           return handler.next(e);
//         },
//       ))
//       ..interceptors.add(CookieManager(cookieJar));
//   }

//   late final Dio dio;

//   final cookieJar = SharedPrefCookieStore();

//   static SharedPreferences? _sharedPreferences;

//   static FutureOr<SharedPreferences> get sharedPreferences async =>
//       _sharedPreferences ??= await SharedPreferences.getInstance();
// }
