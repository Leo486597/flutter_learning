
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

printDailyNewsDigest() async {
  print(getSWData());
}

main() {
  printDailyNewsDigest();
}

Future<String> getSWData() async {
  final url = "https://swapi.co/api/starships";
  String data;

  var res = await http
      .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  var resBody = json.decode(res.body);
  data = resBody["results"].toString();

  return data;
}
