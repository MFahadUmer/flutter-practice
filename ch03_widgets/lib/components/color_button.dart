import '../constants.dart';
import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    required this.colorSelected,
    required this.changeColor,
  });

  final ColorSelection colorSelected;
  final void Function(int) changeColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      itemBuilder: (context) {
        return List.generate(ColorSelection.values.length, (index) {
          final currentColor = ColorSelection.values[index];
          return PopupMenuItem(
            enabled: currentColor != colorSelected,
            value: index,
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.opacity_outlined,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentColor.label),
                ),
              ],
            ),
          );
        });
      },
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      onSelected: changeColor,
    );
  }
}
