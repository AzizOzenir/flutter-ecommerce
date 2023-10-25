import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BasketBody(),
    );
  }
}

class BasketBody extends StatelessWidget {
  const BasketBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            4,
            (index) => Container(
              child: Row(
                children: [],
              ),
            ),
          ),
        )
      ],
    );
  }
}
