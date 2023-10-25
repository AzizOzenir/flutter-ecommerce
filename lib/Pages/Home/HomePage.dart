import 'package:commerce/Controllers/Controllers.dart';
import 'package:commerce/Pages/Home/widgets/Products.dart';
import 'package:commerce/Pages/Home/widgets/customAppbar.dart';
import 'package:commerce/Services/ApiService.dart';
import 'package:commerce/Services/AuthServices.dart';
import 'package:commerce/exports.dart';
import 'package:commerce/Pages/Home/widgets/CategoryChips.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initFunction();
    });
  }

  initFunction() async {
    Controllers controller = Provider.of<Controllers>(context, listen: false);
    final response = await ApiService().getHttp(controller.ActiveCategorie);
    controller.setData(response);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(height: 5),
          CategoryChips(),
          Products(),
          TextButton(
            onPressed: () {
              AuthServices().logout();
            },
            child: Text("logout"),
          )
        ],
      ),
    );
  }
}

class getAppBar extends StatelessWidget {
  const getAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [],
    );
  }
}
