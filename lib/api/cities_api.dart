import 'package:firebase_database/firebase_database.dart';
import 'package:voluntary/models/city.dart';

class CitiesApi {
  static const _pageSize = 200;
  static List<City>? _cities;

  static Future<void> _initCities() async {
    final response = await FirebaseDatabase.instance.ref('locations').get();
    _cities = response.children.map((e) {
      (e.value as Map)['id'] = e.key!;
      return City.fromMap(e.value as Map<String, dynamic>);
    }).toList();
  }

  static Future<List<City>> getCities({String? query, int? page}) async {
    final _page = page ?? 0;
    if (_cities == null || _cities!.isEmpty) await _initCities();

    if (query != null && query.isNotEmpty) {
      List<City> result = _cities!
          .where((city) =>
              city.fullName.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (result.length > _pageSize) {
        result = result
            .where((city) =>
                city.objectName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      return result.length > _pageSize
          ? result.sublist(_page * _pageSize, _page * _pageSize + _pageSize)
          : result;
    }

    return _cities!.sublist(_page * _pageSize, _page * _pageSize + _pageSize);
  }
}
