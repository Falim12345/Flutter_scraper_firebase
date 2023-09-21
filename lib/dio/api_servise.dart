import 'package:dio/dio.dart';
import 'api_link.dart';

Future<Response> performRequest({
  required String symbol,
  required String interval,
  int startTime = 0,
  int endTime = 0,
  int limit = 1000,
}) async {
  Dio dio = Dio();

  try {
    Response response =
        await dio.get(ApiLink.apiBinancKlineLink, queryParameters: {
      'symbol': symbol,
      'interval': interval,
      'startTime': startTime,
      'endTime': endTime,
      'limit': limit,
    });

    return response;
  } catch (error) {
    rethrow;
  }
}
