import 'package:http/http.dart';
import 'dart:convert';
void main() {
  // requestData();
  requestDataAsync();
}

requestData(){
  String url = "https://gist.githubusercontent.com/raphaeltake/8e8668fbf14472b191a6488f0700772f/raw/3dbc73134cc1f6f37c2298493420cbdeff39e015/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  // print(futureResponse);
  futureResponse.then((Response response) {
    print(response.body);
    List<dynamic> listAccounts = json.decode(response.body);
    Map<String, dynamic> mapCarla = listAccounts.firstWhere((element) => element["name"] == "Carla");
    print(mapCarla["balance"]);
  },);
  
}

requestDataAsync() async {
  String url = "https://gist.githubusercontent.com/raphaeltake/8e8668fbf14472b191a6488f0700772f/raw/3dbc73134cc1f6f37c2298493420cbdeff39e015/accounts.json";
  Response response = await get(Uri.parse(url));
  print(json.decode(response.body)[0]);

}