
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _isFavorite
            ? const Icon(
          Icons.favorite,
          color: ColorManager.red,
          size: 30,
          key: ValueKey<int>(1),
        )
            : const Icon(
          Icons.favorite_border_outlined,
          color: ColorManager.grey,
          size: 25,
          key: ValueKey<int>(2),
        ),
      ),
    );
  }
}
