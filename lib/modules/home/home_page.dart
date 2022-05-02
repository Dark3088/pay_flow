import 'package:flutter/material.dart';
import 'package:pay_flow/modules/home/home_controller.dart';
import 'package:pay_flow/modules/my_invoices/my_invoices_page.dart';
import 'package:pay_flow/modules/statements/statements_page.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel userModel;
  const HomePage({Key? key, required this.userModel}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    MyInvoicesPage(key: UniqueKey()),
    MyStatetmentsPage(key: UniqueKey())
  ];

  final colorSelected = [AppColors.primary, AppColors.body];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "${widget.userModel.name}",
                          style: TextStyles.titleBoldBackground)
                    ],
                  ),
                ),
                subtitle: Text("Mantenha suas contas em dia",
                    style: TextStyles.captionShape),
                trailing: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(widget.userModel.photoURL!))),
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(child: pages[controller.currentPage]),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  controller.setPage(0);
                });
              },
              icon: Icon(Icons.home),
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            GestureDetector(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  onPressed: () async {
                    await Navigator.pushNamed(context, "/barcode_scanner");
                    setState(() {});
                  },
                  icon: Icon(Icons.add_box_outlined),
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  controller.setPage(1);
                });
              },
              icon: Icon(Icons.description_outlined),
              color: controller.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            )
          ],
        ),
      ),
    );
  }
}
