import 'package:dio/dio.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/data_source/characters_data_source.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/dio_client/dio_client.dart';
import 'package:get/get.dart';

void inyect() {
  Get.put<ApiConfig>(ApiConfig());
  Get.put<Dio>(DioClient.getInstance().dio);
  Get.put(ApiCharactersDataSource());
}
