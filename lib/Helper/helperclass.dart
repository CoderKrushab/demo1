import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper
{
  ApiHelper._();  //private constructor
  static final ApiHelper apiHelper = ApiHelper._();  //singleton Object

  Future<List> callApi() async {
    var url = Uri.parse('https://single-grocery.gravityinfotech.net/api/searchitem');
    var response = await http.post(url);

    List myAllData= [];   //Data
    if(response.statusCode ==200)
      {
        Map  allData = await jsonDecode(response.body);
        myAllData = allData['data'];
      }
return myAllData;
  }
}