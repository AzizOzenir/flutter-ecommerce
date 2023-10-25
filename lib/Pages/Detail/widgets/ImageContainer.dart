import 'package:commerce/Controllers/Controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ImageContainer extends StatelessWidget {
  int index;
  ImageContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Controllers controller = Provider.of<Controllers>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        controller.data[index]["image"],
        fit: BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        width: 150,
        height: 150,
      ),
    );
  }
}
