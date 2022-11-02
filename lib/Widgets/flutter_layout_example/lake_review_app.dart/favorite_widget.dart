import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  _FavoriteWidgetState();

  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = !_isFavorited;
      } else {
        _favoriteCount += 1;
        _isFavorited = !_isFavorited;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: _toggleFavorite,
            icon: Icon(
              color: Colors.orange,
              _isFavorited ? Icons.star : Icons.star_border,
            ),
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text(
              _favoriteCount.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
