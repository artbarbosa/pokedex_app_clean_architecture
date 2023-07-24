abstract class ILocalStorageService {
  save(String boxKey, String key, dynamic value);
  Future<dynamic> get(String boxKey, String key);
  remove(String boxKey, String key, dynamic value);
}
