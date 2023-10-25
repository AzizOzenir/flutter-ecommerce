import 'package:commerce/Controllers/Controllers.dart';
import 'package:commerce/Pages/Detail/widgets/ColorChips.dart';
import 'package:commerce/Pages/Detail/widgets/ImageContainer.dart';
import 'package:commerce/Pages/Home/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  int index;
  DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: DetailBody(index: index),
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailBody extends StatelessWidget {
  int index;

  DetailBody({super.key, required this.index});
  late Controllers controller;
  @override
  Widget build(BuildContext context) {
    controller = Provider.of<Controllers>(context, listen: false);
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("BACK"),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ImageContainer(
            index: index,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorChips(),
              TextButton(
                onPressed: () {
                  controller.addToBasket(controller.data[index]["id"]);
                },
                child: Text(
                    "Add to Basket "),
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  elevation: MaterialStatePropertyAll(3),
                  shadowColor: MaterialStatePropertyAll(Colors.grey.shade300),
                  side: MaterialStatePropertyAll(
                    BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            controller.data[index]["title"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              controller.data[index]["description"],
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
