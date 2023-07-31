import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<dynamic> getRequest({required String endpoint, dynamic params}) async {
  // ignore: unnecessary_brace_in_string_interps
  var requestURI = '${dotenv.env["API_ENDPOINT"]}/${endpoint}';

  Uri url = Uri.parse(requestURI).replace(queryParameters: params);

  var response = await get(
    url,
    headers: {
      'X-RapidAPI-Key': '${dotenv.env["API_KEY"]}',
      'X-RapidAPI-Host': '${dotenv.env["API_HOST"]}'
    },
  );

  var decodedResponse = json.decode(response.body) as dynamic;

  if (response.statusCode == 200) {
    return decodedResponse['data'];
  } else {
    return null;
  }
}
