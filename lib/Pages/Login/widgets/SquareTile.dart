import '../../../exports.dart';

class SquareTile extends StatelessWidget {
  final String image;
  final double height;
  final Function()? onTap;

  const SquareTile({
    super.key,
    required this.image,
    required this.height,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Image.asset(image)
      ),
    );
  }
}