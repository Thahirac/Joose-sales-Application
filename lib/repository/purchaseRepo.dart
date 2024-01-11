// ignore_for_file: file_names

import 'dart:convert';
import 'package:joosesales/cubit/Response/response.dart';
import 'package:joosesales/networking/api_base_helper.dart';
import 'package:joosesales/networking/endpoints.dart';
import 'package:result_type/result_type.dart';

abstract class dashbordRepository {

  Future<Result?>  purchasedetails(String? secretkey,String? qty,);
  Future<Result?>  redeemdetails(String? secretkey,);
}

class DashBordRepository extends dashbordRepository {
  ApiBaseHelper _helper = ApiBaseHelper();



  @override
  Future<Result?> purchasedetails(String? secretkey,String? qty,) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.purchasedtls),
        {
          "user_secret": secretkey,
          "quantity":qty
        },
        isHeaderRequired: true
    )
    );

    Response response = Response.fromJson(json.decode(responseString));

    try{
      if (response.status == 200) {
        print(response.data.toString() +"*******PURCHASE DTLS*****");
        return Success(response.data);
      }
      else {
        print(response.data);
        return Failure(response.message);
      }
    }catch(e){
      print(e);
    }

  }

  @override
  Future<Result?> redeemdetails(String? secretkey) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.redeemdtls),
        {
          "user_secret": secretkey,
        },
        isHeaderRequired: true
    )
    );

    Response response = Response.fromJson(json.decode(responseString));

    try{
      if (response.status == 200) {
        print(response.data.toString() +"*******PURCHASE DTLS*****");
        return Success(response.data);
      }
      else {
        print(response.data);
        return Failure(response.message);
      }
    }catch(e){
      print(e);
    }

  }

}
