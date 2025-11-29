import 'package:http/http.dart';

void main() {
  requestData();
}

requestData(){
  String url = "https://gist.githubusercontent.com/raphaeltake/8e8668fbf14472b191a6488f0700772f/raw/3dbc73134cc1f6f37c2298493420cbdeff39e015/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  // print(futureResponse);
  futureResponse.then((Response response) {
    print(response.body);
  },);
}
