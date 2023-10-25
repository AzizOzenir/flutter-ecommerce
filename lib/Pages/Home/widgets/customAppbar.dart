import 'package:commerce/Pages/Basket/BasketPage.dart';
import 'package:commerce/Services/AuthServices.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => BasketPage()));
        }, icon:Icon(Icons.shopping_bag)),
        TextButton(
          onPressed: () {
            AuthServices().logout();
          },
          child: Text("Log out"),
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
