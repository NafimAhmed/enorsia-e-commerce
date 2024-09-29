import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utill/sql_wishlist_helper.dart';
import '../controllers/account_controller.dart';

class MyWishList extends StatefulWidget {
  const MyWishList({super.key});

  @override
  State<MyWishList> createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  AccountController accountController = Get.put(AccountController());

  List<Map<String, dynamic>> journals = [];
  bool isLoading = true;

  Future<void> refreshJournal() async {
    print("in funcion call");

    final data = await SQLWishListHelper.WishListgetItems();

    //journals=data;

    setState(() {
      journals = data;
      isLoading = false;
    });

    // isChecked = List<bool>.filled(journals.length, false);
    //
    // for(int i = 0; i<isChecked.length ; i++){
    //   print("is value checked.............."+isChecked[i].toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    accountController.getUserWishList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wish List"),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: journals
                  .length, //accountController.apiWishListMap?['data'].length,
              itemBuilder: (cotext, index) {
                return const Text("data");

                //   ListTile(
                //   leading: Image.asset(
                //     "assets/images/banner_demo_image.png",
                //     height: screenHeight * 0.10,
                //     width: screenWidth * 0.15,
                //     fit: BoxFit.cover,
                //   ),
                //   title: Text("product_id : ${accountController.apiWishListMap?['data'][index]["product_id"]}"),
                //   subtitle: Text("user_id : ${accountController.apiWishListMap?['data'][index]["user_id"]}"),
                // );

                // return Column(
                //   children: [
                //
                //     Text("product_id : ${accountController.apiWishListMap?['data'][index]["product_id"]}"),
                //     Text("user_id : ${accountController.apiWishListMap?['data'][index]["user_id"]}")
                //
                //   ],
                // );
              }),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshJournal();
  }
}
