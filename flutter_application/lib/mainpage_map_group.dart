import 'package:flutter/material.dart';

class MapGroup extends StatelessWidget {
  const MapGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '검색',
          suffixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
