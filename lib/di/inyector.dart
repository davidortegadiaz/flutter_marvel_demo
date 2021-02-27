import 'package:dio/dio.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/bloc/characters_bloc.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/repositories/characters_repository.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/data_sources/characters_data_source.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/repositories/api_characters_repository.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/dio_client/dio_client.dart';
import 'package:get/get.dart';

void inyect() {
  Get.put<ApiConfig>(ApiConfig());
  Get.put<Dio>(DioClient.getInstance().dio);
  Get.put<CharactersDataSource>(ApiCharactersDataSource());
  Get.put<CharactersRepository>(ApiCharactersRepository());
  Get.put<CharactersBloc>(CharactersBloc());
}
