import 'package:flutter/material.dart';

import '../colors.dart';
import '../spacings.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    this.hint,
    this.onChanged,
    this.onClear,
  }) : super(key: key);

  final String? hint;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(x4),
        hintText: widget.hint,
        hintStyle: TextStyle(color: theme.disabledColor),
        filled: true,
        fillColor: customGrey,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(x2)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: disabledColor),
        suffixIcon: IconButton(
          onPressed: () {
            _controller.clear();
            widget.onClear?.call();
          },
          icon: const Icon(Icons.highlight_remove, color: Colors.white),
        ),
      ),
    );
  }
}
