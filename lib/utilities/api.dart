import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<dynamic> getRequest({
  required String endpoint,
  required String responseKey,
  Map<String, dynamic> params = const {},
}) async {
  // ignore: unnecessary_brace_in_string_interps
  var requestURI = '${dotenv.env["API_ENDPOINT"]}/${endpoint}';

  Uri url = Uri.parse(requestURI);

  if (params != {}) {
    url = url.replace(queryParameters: params);
  }

  var response = await get(
    url,
  );

  var decodedResponse = json.decode(response.body) as dynamic;

  if (response.statusCode == 200) {
    return decodedResponse[responseKey];
  } else {
    return null;
  }
}
