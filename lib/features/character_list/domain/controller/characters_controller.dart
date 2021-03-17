import 'package:flutter_marvel_demo/features/character_list/domain/models/character.dart';
import 'package:flutter_marvel_demo/features/character_list/domain/repositories/characters_repository.dart';
import 'package:get/get.dart';

class CharactersController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Character> characterList = <Character>[].obs;
  RxList<Character> showableCharacters = <Character>[].obs;
  RxBool hasReachedMax = false.obs;
  RxBool search = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    if (true) {
      isLoading.toggle();
      try {
        List<Character> _characters = await Get.find<CharactersRepository>().fetchCharacters(
          offSet: characterList.length,
        );
        characterList += _characters;
        showableCharacters += _characters;
        isLoading.toggle();
      } catch (e) {
        return null;
      }
    }
  }

  void filter(String searchValue) => showableCharacters.assignAll(_filterCharacters(searchValue));

  List<Character> _filterCharacters([String searchValue = '']) {
    List<Character> _showableCharacters = characterList
        .where(
          (i) => i.name.toLowerCase().contains(searchValue),
        )
        .toList();
    return _showableCharacters;
  }

  void toggle() {
    search.toggle();
  }

  void closed() {
    search.value = false;
  }
}
