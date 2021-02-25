import 'package:get/get.dart';
import 'package:flutter_marvel_demo/routes/route_names.dart';

import '../main.dart';

List<GetPage> getPages() {
  return <GetPage>[
    GetPage(name: RouteNames.characterListPage, page: () => const CharacterListPage()),
    //GetPage(name: RouteNames.characterDetailPage, page: () => const CharacterDetailPage()),
  ];
}
