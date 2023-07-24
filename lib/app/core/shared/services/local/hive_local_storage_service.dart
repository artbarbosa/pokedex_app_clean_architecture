// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'local_storage_service_interface.dart';

class HiveLocalStorageService implements ILocalStorageService {
  final HiveInterface hive;
  HiveLocalStorageService({required this.hive});

  @override
  save(String boxKey, String key, dynamic value) async {
    final box = hive.box(boxKey);
    box.put(key, value);
  }

  @override
  Future<dynamic> get(String boxKey, String key) async {
    final box = hive.box(boxKey);
    return box.get(key);
  }

  @override
  remove(String boxKey, String key, dynamic value) async {
    final box = hive.box(boxKey);
    box.put(key, value);
  }
}
