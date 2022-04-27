import 'package:flutter/material.dart';

class TextSwitchValue<T> {
  final String name;
  final T value;

  TextSwitchValue(this.name, this.value);
}

class TextSwitch<T> extends StatefulWidget {
  final List<TextSwitchValue<T>> values;
  final void Function(T)? onChanged;
  const TextSwitch(this.values, {Key? key, this.onChanged}) : super(key: key);

  @override
  State<TextSwitch> createState() => _TextSwitchState();
}

class _TextSwitchState<T> extends State<TextSwitch<T>> {
  int _selectedIndex = 0;

  void _onChanged(int index) {
    _selectedIndex = index;
    widget.onChanged?.call(widget.values[index].value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.values.length,
        (index) {
          final _value = widget.values[index];
          final bool _isSelected = index == _selectedIndex;
          return AnimatedContainer(
            margin: const EdgeInsets.all(4),
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: _isSelected ? Colors.green : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              onTap: () => _onChanged(index),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  _value.name,
                  style: TextStyle(
                      color: _isSelected ? Colors.white : Colors.green),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
