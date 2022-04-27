import 'package:flutter/material.dart';
import 'package:voluntary/widgets/text_switch.dart';

class Search extends StatefulWidget {
  final void Function(String, SearchType) onSearch;
  const Search(this.onSearch, {Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  SearchType _searchType = SearchType.city;

  void _handleChangeQuery(String query) {
    widget.onSearch(query, _searchType);
  }

  void _handleChangeSearchType(type) {
    _searchType = type as SearchType;
    setState(() {});
  }

  String _getSearchType() {
    return _searchType == SearchType.city
        ? 'city (Ukrainian names)'
        : 'post name';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 550,
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: _controller,
            onChanged: _handleChangeQuery,
            decoration: InputDecoration(
              suffixIcon: TextSwitch<SearchType>(
                SearchType.values
                    .map((e) => TextSwitchValue(e.name, e))
                    .toList(),
                onChanged: _handleChangeSearchType,
              ),
              hintText: 'Search by ${_getSearchType()}',
              border: const OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}

enum SearchType { city, postName }

extension SearchTypeExtension on SearchType {
  static const _namesMap = {
    SearchType.city: 'City',
    SearchType.postName: 'Post name',
  };

  String get name => _namesMap[this]!;
}
