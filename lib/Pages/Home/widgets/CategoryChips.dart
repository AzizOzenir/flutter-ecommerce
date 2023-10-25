import 'package:commerce/Controllers/Controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryChips extends StatelessWidget {
  

  CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
        Controllers controller = Provider.of<Controllers>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          controller.categories.length,
          (index) => GestureDetector(
            onTap: (){
              controller.setActiveChip(controller.categories[index]);
            },
            child: CustomChip(
                text: controller.categories[index], isSelected: controller.categories[index]==controller.ActiveCategorie),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomChip extends StatelessWidget {
  String text;
  bool isSelected;

  CustomChip({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
          label: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
          selected: isSelected,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 8,
          pressElevation: 0,
          selectedShadowColor: Colors.green,
          disabledColor: Colors.white,
          selectedColor: const Color.fromARGB(255, 0, 255, 8)),
    );
  }
}
