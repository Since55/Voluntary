import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:voluntary/api/cities_api.dart';
import 'package:voluntary/models/city.dart';

class CitySearch extends StatefulWidget {
  final void Function(City) onSelect;
  const CitySearch(this.onSelect, {Key? key}) : super(key: key);

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  final _controller = TextEditingController();
  List<City> _suggestions = [];

  @override
  void initState() {
    _controller.addListener(_onSearch);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearch);
    super.dispose();
  }

  void _handleSelect(SearchFieldListItem<City> city) {
    widget.onSelect(city.item!);
  }

  Future<void> _onSearch() async {
    if (_controller.text.isEmpty) {
      _suggestions = [];
      setState(() {});
      return;
    }
    _suggestions = await CitiesApi.getCities(query: _controller.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SearchField<City>(
      controller: _controller,
      searchInputDecoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      onSuggestionTap: _handleSelect,
      suggestions: _suggestions
          .map((e) => SearchFieldListItem(e.fullName, item: e))
          .toList(),
    );
  }
}
