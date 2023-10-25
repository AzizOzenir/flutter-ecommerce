import 'package:commerce/Controllers/Controllers.dart';
import 'package:commerce/Pages/Detail/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    Controllers controller = Provider.of<Controllers>(context);
        Size size = MediaQuery.of(context).size;
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: (size.width/2.2)/(size.height/3),
      children: List.generate(
        controller.data.length,
        (index) => Product(
          index: index,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Product extends StatelessWidget {
  int index;

  Product({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Controllers controller = Provider.of<Controllers>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              index: index,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(2),
        width: size.width / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.5),
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
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              child: Text(
                controller.data[index]["title"],
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              child: Text(
                controller.data[index]["description"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
            Text(
              '${controller.data[index]["price"]}€',
              maxLines: 1,
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
            Text("rating here ****")
          ],
        ),
      ),
    );
  }
}
