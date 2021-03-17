import 'package:dio/dio.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/bloc/comics_bloc.dart';
import 'package:flutter_marvel_demo/features/character_detail/domain/repositories/comics_repository.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/data_sources/api_comics_data_source.dart';
import 'package:flutter_marvel_demo/features/character_detail/infraestruture/repositories/api_comics_repository.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/controller/characters_controller.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/repositories/characters_repository.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/data_sources/api_characters_data_source.dart';
import 'package:flutter_marvel_demo/features/character_list/infraestruture/repositories/api_characters_repository.dart';
import 'package:flutter_marvel_demo/http/api_config/api_config.dart';
import 'package:flutter_marvel_demo/http/dio_client/dio_client.dart';
import 'package:get/get.dart';

void inyect() {
  Get.put<ApiConfig>(ApiConfig());
  Get.put<Dio>(DioClient.getInstance().dio);

  Get.put<CharactersDataSource>(ApiCharactersDataSource());
  Get.put<CharactersRepository>(ApiCharactersRepository());
  Get.put<ComicsDataSource>(ApiComicsDataSource());
  Get.put<ComicsRepository>(ApiComicsRepository());
  Get.put<ComicsBloc>(ComicsBloc());
  Get.put<CharactersController>(CharactersController());
}
