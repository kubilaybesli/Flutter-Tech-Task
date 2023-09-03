import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:guven_future/model/base_model.dart';
import 'package:guven_future/user_interface/helper/navigation_url.dart';

class BaseService {
  Dio dio = Dio();
  late Box box = Hive.box('box');

   Future<dynamic> get<T extends IBaseModel>(
      String path, {IBaseModel? model,Map<String, dynamic>? params}) async {

      dio = Dio(BaseOptions(baseUrl:"https://${NavigationUrl.baseUrl}"));

     final response = await dio.get(path);

     if (response.statusCode == HttpStatus.ok) {
        return _jsonBodyParser<T>(model!,response.data);

      } else if(response.statusCode == 401) {

    }
  }

  dynamic _jsonBodyParser<T>(IBaseModel model, dynamic body) {
    final result = model.fromJson(body);
    return result;
  }
}
