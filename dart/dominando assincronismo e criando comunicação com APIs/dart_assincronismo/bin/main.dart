import 'package:dart_assincronismo/api_key.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  // requestData();
  // requestDataAsync();
  sendDataAsync({
    "id": "NEW001",
    "name": "Flutter",
    "lastname": "Dart",
    "balance": 5000,
  });
}

void requestData() {
  String url =
      "https://gist.githubusercontent.com/raphaeltake/8e8668fbf14472b191a6488f0700772f/raw/3dbc73134cc1f6f37c2298493420cbdeff39e015/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  // print(futureResponse);
  futureResponse.then((Response response) {
    print(response.body);
    List<dynamic> listAccounts = json.decode(response.body);
    Map<String, dynamic> mapCarla = listAccounts.firstWhere(
      (element) => element["name"] == "Carla",
    );
    print(mapCarla["balance"]);
  });
}

Future<List<dynamic>> requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/raphaeltake/8e8668fbf14472b191a6488f0700772f/raw/3dbc73134cc1f6f37c2298493420cbdeff39e015/accounts.json";
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

void sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccount = await requestDataAsync();
  listAccount.add(mapAccount);
  String content = json.encode(listAccount);

  String url = "https://api.github.com/gists/8e8668fbf14472b191a6488f0700772f";

  Response response = await post(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "account.json",
      "public": true,
      "files": {
        "accounts.json": {"content": content},
      },
    }),
  );
  print(response.statusCode);
}
