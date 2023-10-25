import 'package:commerce/Controllers/Controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorChips extends StatelessWidget {
  const ColorChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) => ColorChip(index:index)),
      ),
    );
  }
}

// ignore: must_be_immutable
class ColorChip extends StatelessWidget {
 

int index;

  ColorChip({super.key,required this.index});
  @override
  Widget build(BuildContext context) {
    Controllers controller = Provider.of(context);
    return GestureDetector(
      onTap: () {
        controller.setSelectedColor(index);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: index ==controller.SelectedColor? controller.colors[index]:Colors.transparent,spreadRadius: 0.25,blurRadius: 10,offset: Offset(0, 2))],
          color: controller.colors[index],
          shape: BoxShape.circle,
          
        ),
      ),
    );
  }
}
