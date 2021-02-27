import 'package:flutter_marvel_demo/features/character_detail/presentation/pages/character_detail_page.dart';
import 'package:flutter_marvel_demo/features/character_list/presentation/pages/character_list_page.dart';
import 'package:flutter_marvel_demo/routes/route_names.dart';
import 'package:get/get.dart';

List<GetPage> getPages() {
  return <GetPage>[
    GetPage(name: RouteNames.characterListPage, page: () => const CharacterListPage()),
    GetPage(name: RouteNames.characterDetailPage, page: () => const CharacterDetailPage()),
  ];
}
