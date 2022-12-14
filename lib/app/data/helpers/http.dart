import 'package:ejemplo/app/data/helpers/htttp_result.dart';
import 'package:ejemplo/app/data/helpers/parse_response_body.dart';
import 'package:ejemplo/app/data/helpers/send_request.dart';

import 'http_method.dart';
import 'package:ejemplo/app/data/helpers/http_method.dart';

typedef Parser<T> = T Function(dynamic data);

class Http {
  final String baseUrl;
  Http({this.baseUrl = ''});

  Future<HttpResult<T>> request<T>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParemeters = const {},
    dynamic body,
    Parser<T>? parser,
    Duration timeOut = const Duration(seconds: 10),
  }) async {
    int? statusCode;
    dynamic data;
    try {
      late Uri url;
      if (path.startsWith("https://") || path.startsWith("https://")) {
        url = Uri.parse(path);
      } else {
        url = Uri.parse("$baseUrl$path");
      }

      if (queryParemeters.isNotEmpty) {
        url = url.replace(
            queryParameters: {...url.queryParameters, ...queryParemeters});
      }
      print(url.toString());

      final response = await sendRequest(
          url: url,
          method: method,
          headers: headers,
          body: body,
          timeOut: timeOut);

      data = parseResponseBody(response.body);
      statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw HttpError(
            exception: null, stackTrace: StackTrace.current, data: data);
      }

      return HttpResult<T>(
          data: parser != null ? parser(data) : data,
          statusCode: statusCode,
          error: null);
    } catch (e, s) {
      if (e is HttpError) {
        return HttpResult<T>(
          data: null,
          statusCode: statusCode!,
          error: e,
        );
      }
      print(e);
      print(s);

      return HttpResult<T>(
          data: null,
          error: HttpError(
            data: data,
            stackTrace: s,
            exception: e,
          ),
          statusCode: statusCode ?? -1);
    }
  }
}
