import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zartek_machine_test/constants/constants.dart';
import 'package:zartek_machine_test/model/productModel.dart';

class Services {
  final client = http.Client();
  var uRL = Uri.parse("${baseURL}v2/5dfccffc310000efc8d2c1ad");
  Future fetchData() async {
    var response = await client.get(uRL);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      List<Map<String, dynamic>> jsonList =
          json.decode(jsonBody).cast<Map<String, dynamic>>().toList();
      final List<ProductModel> data =
          jsonList.map((map) => ProductModel.fromJson(map)).toList();
      return data;
    } else {
      log("Some error");
    }
  }
}
