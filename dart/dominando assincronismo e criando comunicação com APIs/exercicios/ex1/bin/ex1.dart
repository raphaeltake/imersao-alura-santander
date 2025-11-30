import 'package:ex1/api_key.dart';
import 'package:http/http.dart';
import 'dart:convert';

/*
Exercício 1: Adicionando um novo produto ao catálogo
Crie uma função que adicione um novo produto ao catálogo existente representado por uma lista JSON. O produto deve conter as chaves id, name, e price.
*/

void main() {
  insertData({"id": 10, "name": "celular", "price": 2000});
}

Future<List<dynamic>> resquestData() async {
  String url =
      "https://gist.githubusercontent.com/raphaeltake/2866421c1c6d06f68c9e619a2119f629/raw/4a988a2a946dc22962e5b39decdda44693f95dba/products.json";
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

void insertData(Map<String, dynamic> mapProducts) async {
  List<dynamic> products = await resquestData();
  products.add(mapProducts);
  String content = json.encode(products);
  String url = "https://api.github.com/gists/2866421c1c6d06f68c9e619a2119f629";

  Response response = await post(
    Uri.parse(url),
    headers: {
      "Authorization": "Bearer $githubApiKeyEx1"},
    body: json.encode({
      "description": "products.json",
      "public": true,
      "files": {
        "products.json": {"content": content},
      },
    }),
  );
  print(response.statusCode);
}
