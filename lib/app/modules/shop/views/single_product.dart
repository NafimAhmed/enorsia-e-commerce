import 'size_guide_view.dart';

import '../../account/views/my_bag.dart';
import '../../utill/constant.dart';
import 'video_player.dart';
import '../../utill/app_size.dart';
import '../../utill/sql_wishlist_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';

import '../../utill/app_colors.dart';
import '../../utill/sql_helper.dart';
import '../controllers/shop_controller.dart';

class SingleProduct extends StatefulWidget {
  //final String Product_slug;

  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  RxBool videoVisibility = false.obs;
  RxBool isVideo = false.obs;
  // RxBool isShopProductDetailByColorLoading = true.obs;
  // Map<String, dynamic>? apiShopProductDetailByColorMap;
  // RxInt ImageIndex = 0.obs;

  var sizeList = <String>[];

  List<Map<String, dynamic>> wishList = [];
  bool isLoading = true;

  RxInt currentColorIndex = 0.obs;
  RxInt sizeIndex = 0.obs;
  RxDouble totalPrice = 0.00.obs;
  double productQuantity = 1;
  int selectProductColor = 0;
  RxString emailForStockRequest = "".obs;

  // String token = "5|YyEX56zcLMxQFrE94iMyV19ry5SDRGphZMVigEXz";

  ShopController shopController = Get.put(ShopController());

  ////////////////////////////////////////////////////////////////////////

  Future<void> refreshWishList() async {
    print("in funcion call");

    final data = await SQLWishListHelper.WishListgetItemProductID(
        "${shopController.apiShopProductDetailMap?["data"]["product"]['id']}");

    //journals=data;

    setState(() {
      wishList = data;
      isLoading = false;
    });

    // isChecked = List<bool>.filled(journals.length, false);
    //
    // for(int i = 0; i<isChecked.length ; i++){
    //   print("is value checked.............."+isChecked[i].toString());
    // }
  }

  //////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    double netPrice = double.parse(
        "${shopController.apiShopProductDetailMap?["data"]["price"]}");
    totalPrice.value = netPrice;

    sizeList.clear();

    if (shopController.apiShopProductDetailMap?['data']['firstSizes'].length >
        0) {
      for (int j = 0;
          j <
              shopController
                  .apiShopProductDetailMap?['data']['firstSizes'].length;
          j++) {
        sizeList.add(
            "${shopController.apiShopProductDetailMap?['data']['firstSizes'][j]["product_size"]["uk"]}");
      }
    }

    RxString selectedSize =
        shopController.apiShopProductDetailMap?['data']['firstSizes'].length > 0
            ? sizeList[0].obs
            : "".obs;

    if (shopController.apiShopProductDetailMap?['data']['product']
            ["video_status"] ==
        1) {
      videoVisibility.value = true;
    } else {
      videoVisibility.value = false;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  shopController.isShopProductDetailByColorLoading.value == true
                      ? SizedBox(
                          height: screenHeight,
                          width: screenWidth,
                          child: Center(
                            child: Lottie.asset("assets/json/loading.json",
                                fit: BoxFit.cover,
                                height: screenHeight * 0.095,
                                width: screenWidth * 0.095),
                          ))
                      : InteractiveViewer(
                          boundaryMargin: const EdgeInsets.all(20),
                          minScale: 1.0,
                          maxScale: 4.0,
                          child: isVideo.value == true
                              ? VideoApp(
                                  videoLink:
                                      'https://enorsia.com/upload/ecom_products/${shopController.apiShopProductDetailMap?['data']['product']["video"]}',
                                )
                              : FadeInImage(
                                  image: NetworkImage(
                                    "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductDetailByColorMap?["data"]["images"][shopController.ImageIndex.value]["image"]}",
                                  ),
                                  placeholder: const AssetImage(
                                      'assets/images/placeholder_image.png'),
                                  fit: BoxFit.cover,
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/placeholder_image.png",
                                      height: screenHeight / 2,
                                      width: screenWidth,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  height: screenHeight / 2,
                                  width: screenWidth,
                                ),

                          // Image.network(
                          //         "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductDetailByColorMap?["data"]["images"][shopController.ImageIndex.value]["image"]}",
                          //
                          //         //"https://enorsia.com/upload/ecom_products/${shopController.apiShopProductDetailMap?["data"]["product"]["featured_image"]}",
                          //         height: screenHeight / 2,
                          //         width: screenWidth,
                          //         fit: BoxFit.cover,
                          //         loadingBuilder: (BuildContext context,
                          //             Widget child,
                          //             ImageChunkEvent? loadingProgress) {
                          //           if (loadingProgress == null) return child;
                          //           return Center(
                          //               child: Center(
                          //             child: Lottie.asset(
                          //                 "assets/json/loading.json",
                          //                 fit: BoxFit.cover,
                          //                 height: screenHeight * 0.095,
                          //                 width: screenWidth * 0.095),
                          //           ));
                          //         },
                          //       ),

                          // Replace with your image asset
                        ),
                  Positioned(
                      top: screenHeight * 0.020,
                      left: screenWidth * 0.030,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: screenHeight * 0.020,
                          color: AppColors.colorLightBlack,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.020,
              ),
              shopController.isShopProductDetailByColorLoading.value == true
                  ? Visibility(
                      visible: false,
                      child: Center(
                        child: Lottie.asset("assets/json/loading.json",
                            fit: BoxFit.cover,
                            height: screenHeight * 0.095,
                            width: screenWidth * 0.095),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      height: screenHeight * 0.14,
                      width: screenWidth,
                      child: shopController
                                  .apiShopProductDetailByColorMap!["data"]
                                      ["images"]
                                  .length ==
                              0
                          ? Container()
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  shopController
                                              .isShopProductDetailByColorLoading
                                              .value ==
                                          true
                                      ? Center(
                                          child: Lottie.asset(
                                              "assets/json/loading.json",
                                              fit: BoxFit.cover,
                                              height: screenHeight * 0.095,
                                              width: screenWidth * 0.095),
                                        )
                                      : ListView.builder(
                                          itemCount: shopController
                                              .apiShopProductDetailByColorMap?[
                                                  "data"]["images"]
                                              .length,
                                          //shopController.apiShopProductDetailMap!["data"]["relatedProducts"].length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  shopController
                                                      .ImageIndex.value = index;
                                                  isVideo.value = false;
                                                },
                                                child: FadeInImage(
                                                  image: NetworkImage(
                                                    "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductDetailByColorMap?["data"]["images"][index]["image"]}",
                                                  ),
                                                  placeholder: const AssetImage(
                                                      'assets/images/placeholder_image.png'),
                                                  fit: BoxFit.cover,
                                                  imageErrorBuilder: (context,
                                                      error, stackTrace) {
                                                    return Image.asset(
                                                      "assets/images/placeholder_image.png",
                                                      height:
                                                          screenHeight * 0.14,
                                                      width: screenWidth * 0.15,
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                  height: screenHeight * 0.14,
                                                  width: screenWidth * 0.17,
                                                ),
                                              ),
                                              // Image.asset(
                                              //   "assets/images/banner_demo_image.png",
                                              //   height: screenHeight * 0.14,
                                              //   width: screenWidth * 0.15,
                                              //   fit: BoxFit.cover,
                                              // ),
                                            );
                                          }),
                                  Visibility(
                                    visible: videoVisibility.value,
                                    child: InkWell(
                                      onTap: () {
                                        if (isVideo.value == true) {
                                          isVideo.value = false;
                                        } else if (isVideo.value == false) {
                                          isVideo.value = true;
                                        }

                                        //isVideo.value!=isVideo.value;
                                      },
                                      child: Container(
                                        height: screenHeight * 0.14,
                                        width: screenWidth * 0.17,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductDetailByColorMap?["data"]["images"][0]["image"]}"),
                                                fit: BoxFit.cover)),
                                        child: Icon(
                                          Icons.videocam_outlined,
                                          color: Colors.white,
                                          size: screenWidth * 0.09,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: screenHeight * 0.025,
                    child: shopController
                                .apiShopProductDetailMap?["data"]["colors"]
                                .length ==
                            0
                        ? Container()
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: shopController
                                .apiShopProductDetailMap?["data"]["colors"]
                                .length,
                            itemBuilder: (context, indexColor) {
                              print(
                                  "Color code length-----------------------------------${shopController.apiShopProductDetailMap?["data"]["colors"].length}");

                              return GestureDetector(
                                onTap: () {
                                  currentColorIndex.value = indexColor;

                                  print(
                                      "selected product color............$selectProductColor");

                                  print(
                                      "selected product color............$currentColorIndex");
                                  setState(() {
                                    selectProductColor = indexColor;

                                    shopController.getShopProductDetailByColorData(
                                        "${shopController.apiShopProductDetailMap?["data"]["product"]["style_design_id"]}",
                                        "${shopController.apiShopProductDetailMap?["data"]["colors"][indexColor]["id"]}");
                                  });
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 2.0, right: 2.0),
                                    height: screenHeight * 0.025,
                                    width: screenWidth * 0.050,
                                    decoration: BoxDecoration(
                                        // color: Color(ColorConvert.getColorFromHex(
                                        //     "${shopController.apiShopProductDetailMap?["data"]["colors"][indexColor]["e_commerce_color_code"]}")),
                                        border: Border.all(
                                            width: 2.0,
                                            color: selectProductColor ==
                                                    indexColor
                                                ? shopController
                                                        .apiShopProductDetailMap![
                                                            "data"]["colors"]
                                                            [indexColor][
                                                            "e_commerce_color_code"]
                                                        .toString()
                                                        .contains("#000000")
                                                    ? AppColors.colorLightOrange
                                                    : AppColors.colorLightBlack
                                                : Colors.transparent)),
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductDetailMap?["data"]["colors"][indexColor]["aop_image"]}"),
                                      placeholder: const AssetImage(
                                          'assets/images/placeholder_image.png'),
                                      fit: BoxFit.cover,
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          height: screenHeight * 0.29,
                                          width: screenWidth * 0.95,
                                          color: AppColors.colorWhite,
                                        );
                                      },
                                      height: screenHeight * 0.29,
                                      width: screenWidth * 0.95,
                                    )
                                    // Image.network(
                                    //     "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductDetailMap?["data"]["colors"][indexColor]["aop_image"]}"),
                                    ),
                              );
                            }),
                  ),
                  sizeList.isEmpty
                      ? Container()
                      : Row(
                          children: [
                            Obx(
                              () => Container(
                                height: screenHeight * 0.040,
                                width: screenWidth * 0.350,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffC4C4C4), width: 1),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    // underline: SizedBox(),
                                    isExpanded: true,
                                    icon: const Padding(
                                      padding: EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onChanged: (val) {
                                      selectedSize.value = val.toString();

                                      sizeIndex.value = sizeList.indexOf(val!);
                                    },
                                    value: selectedSize.value,
                                    items: sizeList.map((selectValue) {
                                      return DropdownMenuItem(
                                          value: selectValue,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: screenHeight * 0.019),
                                            child: Text(selectValue.toString()),
                                          ));
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => SizeGuideView());
                                // WidgetsBinding.instance
                                //     .addPostFrameCallback((timeStamp) {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) => AlertDialog(
                                //             content: SingleChildScrollView(
                                //               child: Container(
                                //                 padding:
                                //                     const EdgeInsets.all(5),
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     // InteractiveViewer(
                                //                     //     child: Html(
                                //                     //       data:"<div class='modal-content'> <div class='modal-header'> <h1 class='modal-title fs-5' id='exampleModalLabel'>Size Guide</h1> <button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button></div> <div class='modal-body' id='size-guide-modal-body'><div class='style-9' style='overflow-x: auto;'><p><img style='width: 1012.65px; height: 631.562px;' src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABA8AAAKICAYAAAAfJdOBAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAA"
                                //                     //           "FiUAABYlAUlSJPAAAO+uSURBVHhe7P17lCTXVeeP7pJkyZL8fgK2f3ZVdaqMSBgMeB7Vd/Eo53C7W0WVZhVLA1zuaGZ+k9U0c6HKQNUUQ+MxIH6T0x6gilcvVXJ/C5k1rIWYBBWUuhumOmf+6R7GdzEYk8guZVen35afki"
                                //                     //           "xbbznv2SfOyYyIjIgTkRmRGY/vRyvUFY+MOOcbO85jxz4nproCAgAAAAAAAAAAAPDhBvUvAAAAAAAAAAAAgCdwHgAAAAAAAAAA"
                                //                     //           "ACAQOA8AAAAAAAAAAAAQCJwHAAAAAAAAAAAACATOAwAAAAAAAAAAAAQC5wEAAAAAAAAAAAACgfMAAAAAAAAAAAAAgcB5AAAAA"
                                //                     //           "AAAAAAAgEDgPAAAAAAAAAAAAEAgcB4AAAAAAAAAAAAgEDgPAAAAAAAAAAAAEAicBwAAAAAAAAAAAAgEzgMAAAAAAAAAAAAEA"
                                //                     //           "ucBAAAAAAAAAAAAAoHzAAAAAAAAAAAAAIHAeQAAAAAAAAAAAIBA4DwAAAAAAAAAAABAIHAeAAAAAAAAAAAAIBA4DwA"
                                //                     //           "AAAAAAAAAABAInAfAk4unp2hqSizHd+ia2jZ+rvXTcfqi2gYAAACAIpKOtskooF0DAMg2GXYe2ArgzFYibqLk6RrtHFfHxl"
                                //                     //           "4BXaSHdq2/5u+5i45Zf06AY3Ty7lXrz937aCcfNxkAAEBuQdsk/22TUUC7BgCQbVLrPLh2cYdOHz9uVUByOU7HRUXUL2fbvUqEr"
                                //                     //           "j4i1saNqEx3TtNxRxrFItaPn96hi0NVCJPOk8W1nfvISsYqnV3zqJ6vcUNC5NOV79M7/ftzbcepC2viJ8nAsfba9OTdIhXMVX"
                                //                     //           "rw4aFEBQAAAGIBbZMUtk0unu7l0+6vuGbbzvdJNFFcXOw5OhztDk2Itk7PqTJ1WpzNzUU6rX9nTxjaNQCALNNNIe3t+S4nzXNZvaC"
                                //                     //           "P6l5YVdvmt8XaGGlvd+fd6XIvQ6UpSp7a3e15dWxPkzgwnPfCamDe57etVPfyYVs8k+mlpevAid1nAAAAQIG2SZjfT6BtItolOn/"
                                //                     //           "2XQP3ayDtF7qiEy/36bZLj8htnVVxNjf986NdAwDICymMPLhIH1i/av05v00X2l12cFC33aYLq/MkCnPFMTp5v9p3ZW184WvXd"
                                //                     //           "uh4aZ2sFM7T6vYFEgW/lQ6xtNsXaFukczgmlCcHbXpEy39nyfpDw3k/tdvP+4V2L99d33yLe6Y27z406Je/9vCD1vnEQX6qle5Ue"
                                //                     //           "64+SHDSAwAAGD9om4w9Tw4C2iYmdPvi6jp9YLAZMshQbZ1ooF0DAMgq6XMeXHuUWupPHtN2UtdSx7jyukJX7j+pNtjG1ekxeFz"
                                //                     //           "g6xAx1+IcejcYinb8+OlQ4XwXP6ArZxIVyhW6f+2koyI9duwkrYl09itYj3RKvLb7HSv2XDxtS+9xkZ+gwMHh80cXH1JhgUTlO5"
                                //                     //           "xNhIG8926OQOX7ysAwhzLdc4+qJHcfcoX1XaOHH1TV8z33iCO9OXaH3nOVHplUvCQAAIDigraJx7FiTwraJmbuobPbVjvE6yWGm+"
                                //                     //           "HaOtFAuwYAkFXS5zw4dkevE3l1/V5REYWpVaLAY9BKdGr3aq9yYK5e3aVTpeOGyWv6k/WIGkVUKOrvpBGVc6nnBWeu0u6pU6Rfgjg"
                                //                     //           "ZJX+ian+01zwip3Pflndapbsj5P2Ou+5Rb2V2yVFvX3uYLN/BPN1z1x1ykyelO9XviVqPxm0PAAAAgAG0TQZJRdskHKW1s9Y8A8ZJCodv60QC7RoAQEZJ4bCFk7"
                                //                     //           "ShPMRWRVSyvNm2CWp8ObZGV3RoWbdNvdPMb9OGqgAunj6lvNfztN0LO7ygjr1K60ExbfY3D8PUXkNxjXbu67UKVKgkh0mq"
                                //                     //           "TS5Gyp+greMCRTPJ4dy35Z1W7xZ3KQLH7qJ+8EH/+v0hC/fQXUFOfHujDS56AAAAYwdtEycpaZuERt+/8FpGa+vs0ilbRIW16Dx7gH"
                                //                     //           "YNACCjpPJrC8fWrlB7e7XnlZUV9fopKvFsuSEdtNd27u15v1fP6jA922d+th+gXtTZsZN0l29ovY32IyIlFvawuf5su7bFGYs4PL"
                                //                     //           "2385zmDRUqyWGStgZIjxHzlxjHPK7fHz+a3U8uAQAAKApom9jIYNvkWOjoAwAAAH6k0nnAHFu7n66wF9tVUa+XvD6H48Y2sZE9hM/mUb"
                                //                     //           "66zm8N+hVqqRdn16IwEWTGMLPWo+a3EWHwaRR4EmP+4uaYbejCfVxr98Yv8pAFQ76oRHpuIQAAAGBSoG2iyGTbJGT0wVCs0oVedIleLlj"
                                //                     //           "OCk/QrgEAZJPUOg8sjtFJXVH3SmDXuHkP+uFxojCPPPgvICTONkbNHmbWm4U4sKJIC0OG/NlC7IZqfNiGLlx98GHa6b2GMAxZkPRnWQYAAAAmC9om8TPscIRo9KMPfCIdRm3rhAbtGgBANkm"
                                //                     //           "580AjKuq7Q1Z9F0/TKdUvXb1wv3O8mq1SmN+2fXrHsbh+Y8fWAR5b2FuUSXVGzV8gNi952M8dObANXRC/X9f3qBe2C"
                                //                     //           "QAAAGQJtE2YybZNoqKjDzgKkjze/o/a1gEAgHyTPueBqGCnjp+mHftMxtcu2ibmCZpp9yKd1rWzbSKiPv1KgWdLHrjG6eOG8"
                                //                     //           "YDHaO2BbVVhcpgif5bIVEsfo/4XefT3fPlzRSWfGYld2Crdq+sfUJ808vv9qPnj9oCuNd0hhCLvZ/uNpN1TrrxfU59gCjh/f+iC"
                                //                     //           "JuRMxraQx/FNBgUAAAAo0DZxkpq2SXR09MHV9fvoQWuTjdHbOqFAuwYAkFW6aePCapeT5bfMb7fVge3u9rzaPr8t1gQBv+39rr3dF"
                                //                     //           "VWQ5zFyWb1gHRdAW1wn8By86DQxPuman5+3/u4d65En3rqtjvNb7GkeNX+2tHodGjYtF1b1ttVu/zS2/NmOtbjQFdW1x3aBIU0AA"
                                //                     //           "ABAogS0L3hB28Rjsac5ybaJz75e+ux5VrjT3r9/FqO1dTRo1wAA8kf6Ig9ObpCoAElUXmqDxfw8fwqoTVd60/QOCX8yiT8PtDrvfAsurrd6oU3tEOMQj528X5xDTZjkTKZ"
                                //                     //           "M9+rqNl14wBaOL46XeVKr4ih5rStntd8+mIEZnsU1tjmtojYfYNT8GUIRZVrE+VcHM06r2xcM5z9Gd9k8+qshP6A86vedAQAAgJFA22SANLVNonJs7QHHVyHKd6g/FKO1dcygXQMAyCpT7EFQfwMguEY7x1XY4fw2ta9Mek6CtKUHAAAAAOMlT20BtGsAANklIxMmgvFhn9hQj4OcJP0ZiefvuQsVLA"
                                //                     //           "AAAFA40tY2GQW0awAA2QXOAzBA71NGdJUenHANfW3nPvVpq3m6x/xNRwAAAADkkDS1TUYB7RoAQJaB8wB4cJLuXrU8/FcffJgmV0Vfo4cftNzz86tnadQhpQAAAADIKmlpm4wC2jUAgGyDOQ8AAAAAAAAAAAAQCCIPAAAAAAA"
                                //                     //           "AAAAAEMjEIw+mpqbUXwAAAABIC0UOTETbBAAAQBZJuu5OhfOgyA2UcQO9+0CL+IGmowMNRwcajk7RNYQNJQ80Dg+0Cg/KLuQf+U82/xi2AAAAAAAAAAAAgEDgPAAAAAAAAAAAAEAgcB4AAAAAAAAAAAAgEDgPAAAAAAAAAAAAEAicBwAAAAAAAAAAAAgEzgM"
                                //                     //           "AAAAAAAAAAAAEAucBAAAAAAAAAAAAAoHzAAAAAAAAAAAAAIHAeQAAAAAAAAAAAIBA4DwAAAAAAAAAAABAIHAeAAAAAAAAAAAAIBA4DwAAAAAAAAAAABAInAcAAAAAAAAAAAAIBM4DAAAAAAAAAAAABALnAQAAAAAAAAAAAAKB8wAAAAAAAAAAAACBwHkAAAAAAAAAAA"
                                //                     //           "CAQOA86NGh+vIszc7als2m2ifo1Gl5dpNsW4CDHOrnl+aweYn7uAA69WVarnfUmkCeM+he8HavazZp076Pj7X/Ni6M6RtNj2HJgo7NTVc6mOamTJ8j7QLPY93ErHfmbJHx08C+3e+YGMikZmAMoF0SDznX0S/9YfMV93EB9Mo6+7nk34P118Axo5Rl6hppu/9J65GZ9kJC+R/AL/0D148vj3YmZv8xA+eBorlZodpcnY6OjtRyQFuH1f6DNF2lvaNztGCtARfQz4M48hyqEGvS+docrVWn1aqoGCptWvO7F5IylcsNuuQ+cfMSNcpin1rlPKxRlWIts0KlL2ZypON0SZz18Eg0h/s0LzVoZWWFWm371g4dHYoUllR+/Ahrp3m0xSjE8Tx7kmPNwEigXo0H6GggjvwPUz+4aNXO+/9+lLIsK20OF3Hokan2govE7MFEHM+DJynN7xDAeSBp0qVGmbbO2E1lmqrbW1RuXPK/mUAB/SZJp75Dh1"
                                //                     //           "tnVEHXpM2qqBjq9oJP34sd6js252hxsSzqFHvlIX7NlcriolqzWDixQo2duqPyGZ6w6Rs/WdFxurJI5Vbbdh5+/lboxLkTtOJ43jrUbpVpsWJoDMRItmwxHUAz4A3q1XiAjmnBWda5WaGtrUPaCWgEDFeWZaXN4SYePbLTXnCTlD1MjjzlF84DyTSVyi2qnXdVI3bvk92Lxl5MDntyLX2PkCisettNnrc8UHT9fNLr9rzKdXXcZl2GUTq8iDZdrO3ivJUatahB1dlln0quQwf71C/w+c2jKIROuEsneS/2yO7wnBWVCu0fDFYqFbWqWRCVTGufDuIosSKkb1APTYB9OGxLa5YzHadnRdfR9ta5c0SH5ZJ4Cvk5PKR"
                                //                     //           "ef1K+hV6kXlvA/dxpUd12WgQNh8GhE4dBCx3qNq3sRuqpoRc51wyMANol8QAd+/ik3V0HyHV1XFJtFQ9mq9u0uB/w9nWYsiwrbQ4PYtEjK+0FDxKxhzA48phQXe/BxPI7BHAeSKapulenlUbV2zjcLJyzhb8dUX1FbFup0zmrFhKGViWqW/sOtg6pupz3tz551o8LP5UnvchCURM2vVZhOqePK+1TrX8SgbjOpROWJkKQRpULrgU6d7BFZVHx1d2VnKZzQPutOZq175MVQwimK7RItoKIK4+VE1ZjyoHV+HJEuI1CqPR56cEE6S00rh7S1oG176g+R7V13pc3HRfohHhm9FvnjlUjibNPk9WfVNs5BnFuVuWBtRFNKKUba0qeb12KoqEXpmfdjeiQ1NgUWSur"
                                //                     //           "/LPGLPpp6EHmNQPJgXZJPBRFxwy2VQYQ92qNqOp7f4Ysy7LS5hggDj0y1F4YICF7SEtdP0BS+Y0fOA96CGOXhtE3DmlQQZWMgCcYqR5u0YFVsygD6Xs5p4UlFOOtT17148JP50stslBUhE2v9OpukY6clMdZfypsYZXTpf75TXTaAQWeCWflIUOeB9zzzDTNzvUrn/Hgo4dRb1vByo3AvapIfQgypiOHr+nxip12S9T5Vi6nxQVa6m00b++nw3o+9WMmPdjqz0GKoeEghmfdg34o7AKd2SrbxpCG1DC3zy+IB7RL4qEIOuakrbJwhrYO/YYTJFmWpbTNEYMemW4vJGIPKa7rJ2b/0YDzwBNV0bAxBYyJ4lkzZcUyYCx2r"
                                //                     //           "1ZVrBWNoulnTq/06jpgD6L6U2LySAbg9qo7xrcFw+PhRO9DHK9CnnVlkSSh0hekh5/ebHd1EjvVPnfooYEs6ciNGzkJkut6MqyN0+2RDnsoqu9zVSANY4YbYqJWF+mPqGGBNQNRQLskHoqsY8raKp5MU3V7kfbdw0xGISttDk9i0CMr7QVPErCHEYmtrvckffn1As4DRo5Z0SFKNjgs1C9ERPymUpujuqeXye3V8gnbyQuF18+cXl"
                                //                     //           "nYOODJadSfo8CVgr1ilB5ij1nYxd3hMXsDBRuPh2MvelOPg0uYqOnzJEhv1TDkxRF6aCBrOuqQ9YHrcUPvkI7c27khUNmnRR1eJyo8/zcJBdEwZpxhnyE1LLhmIAC0S+IBOtpIUVsliGk1s/yBWh+FrLQ5ghhVjyy0F4KI0x5iIJa6PoiU5dcLOA8YDhMpNwbGf3Xq61SjfvhWD66M5DgXHcZiQ1ZItoLKMfFGTimyfmHTyxVYq0bamcizroZ/Y2Gb1MaIFVLVqNonbrHG7NlDEfvweLgW1ao1NQ7OC+sTPjrUbTSips9FkN7y76AJa/KkI4evtWh/R49f1Fih7O1Lbed2GTLXf7PS3PR5k1AoDUenP/Mxf4JJhX0aNQwi/5qBkKBdEg/Q0SJ1bZVgFs5s0WHNPQ59mLIsK22OYEbTIwvthWDis4fhiL+uD2bS+TUB54Fkmqp7R1Sfq1Flth9+Utlf9AhZE4XODj9GosFW6R/bn2WTz2ULY5HeO49KKFcUWb+w6V2QE8gcquMq7TlaoTKZPqlrVVyWVp4ecnfFJpiu7pGcuKWnr/rGtedbFJEynk1HpMV/FljrEz7GtIYkavqcBOjNsyfbz2tvAOZQRzmOUdQs7uvxm6NGo+GsYHQDWuZjlnZKdbHu8datYBqOyspcW5V5VTrcOrDGiAZp6KaAmoGwFLlejRPoaBE27eNrqwQiytFt0el3MlxZlpU2RyAj6pGF9kIgMdrDMCRR1wcy4fwa6U6YFCShUEDvPpPV4nJ3Y2apu3tdrY7A9d2l7lIcJ/Lj8kZ3Zmm3G+YKWbavtOgIDQNIjYbXu7tLM92Ny2p1BNL0/Nopel1R9PyPA2gcnslplaK2Ss7q0KT0QP7j"
                                //                     //           "zH+K6voU2T8iDwAYB+7wJp7ReJSJh2zw7L9ztYBvw46InMV9LYyHPttAx9GBhtGBZgCA1JDitkreyrKi61G0/Ocpv3AeADAOZAgShQtvigyP6TuknV5tHyOiIbFzGGJcYC6AjqMDDaMDzQAAKSGtbZVclmVF16No+c9Pfqc4/ED9PRGmpqY4vkKtgaSB3n2gRfxA09GBhqMDDUen6BrChpIHGocHWoUHZRfyj/wnm39EHgAAAAAAAAAAACAQOA8AAAAAAAAAAAAQSCqGLQAAAAAgXRQ99BMAAADIGknX3ZjzoGBA7z7QIn6g6ehAw9GBhqNTdA1hQ8kDjcMDrcKDsgv5R/6TzT+GLQAAAAAAAAAAACCQDDoPmrRp/wZtD96uPi0jl80I39L0O2eH6su2cy7XxZaY6TSpqU/acX1fFxQMs701N4P3A4V8lmxa+erl9+wDaBgDoTUUoPzPMGiXgCzhtKHl"
                                //                     //           "gZtr2u8m/PGd+rI4RtlTpm3L/Gznu72Wx/yHLa/9ymY/zMdn7rnoTpioSbi8MdOdmVnq7l5XGySXuxszYvvGZbWujlva7ToO88H7nNe7u0vOc0Q5Zyiu73aX7Nd1rydACm55akiXFmZ74/Ulm3HEbo8xkBpNL2+E0sb72Z8s0HB0sqZh7/lPkY5Fryui5N/7GUC7xETRbSwKcWolbaZnl5adDrQtAva7CX08l4c9W0quzEverszP9vXdJdu6yqvt+CRB/ofJvzlPGrk9gt0aj4/5uRhHuZqhyAPLI1RtqFU7zUvUoDJtnVlQG4gWzmxRubVPB4Gem4Bzdg5ovyXOuV2labUp3DkBGAKTvXXqtNMo02JF74U9BtE5OiSam+1pOUjAsw8k0HB0zBpadOrrVBN1WFmtg6yAdgnIGKot0bfLBTqzVabW/oH1Zti0303o44VdC6Neqe9RVRhvpss847PdpPO1Fq2s6ed0mqprK0SNS2JPDshj/kOV11HbPGGOz+ZzkR3nAd/YlTodHYibqTb1WDhHR0eW8JEIOmdUdJhJk//th73I8C25r79tk58e3lapUUv8V6u4wrwONnvH9o7XuM41sB/kk06bWuVFsvkORHlcpb1h7L4AdNotKpcChInz2c8p0HB0jBoyokxfr81RfXtRbQCZAe0SC7RLsoOp3RC"
                                //                     //           "1XRHqeB7WUKXDrQM6x32zrJd5pme7c0SH4ul1FP0LJ2hFdE8v5eG5yGP+w5TXUctm4/HZfS6y4zzgGyvVDUfzvKgA3Z0tN0HnnK7QYllUoOv9cTrmc4rjd4i2j46EER7RAXtfaxWaXXdua1Q3qckFrjSoMm0dHNFez2LFOfZLdOA+nnfJin2fFsXxvE8u4hyHVVTUmcdgb703mE17A85vPFbRadIl9vTur/trFbE8KR7QcHRCaMiNh/UazdXPEZTMIGiXoF2Sedxvid2Y9rsZPL65WaHaXF3ZUz7LPMdzyC97aI5mwwmWC/KY/4GyNWqbx3B8lp+LXH5tgSeeqHIYlS20LzrTVN07ovpcjSqq4Vc93KKDveBz2gvM6cqi9DYNbjukI5tD303w8a4HUnp9jyyvFcgwwfbGbzBFa41mL53oN9DqRNXcTcITA9LrLVjctjVmS7QDZ0t4oOHohNBQhiiKxgPK7/yDdglIF/zWk22oSo3yFtmitRWm/W58jm9uWjaqjCGPZV6UZ/sw6CHLKHnMfzzldQAZfy5y5zzgG15hr6caPzI8aqwK1VXD74C2iCvsoMazK0xH4rUtiIDjRYW8ttKgqmo0zMKtnyNC2JuokHVBI+EwsFaNzsMMnKiGa/+tmWB6VjRvcxIyOA6g4eiYNNQhinlqRQNP0C4B6cNyREk7Wmt72JBpvxuP4zkqpUpU186tHJZ5UZ/tuZyFI+Qx//GV1z7k4LnIlfOAPwtSqZEMt7PfAzYEWampJegzMj14rAqt2G6mKBi3OZwv2DufNAvnVOF8VKcVfhMt82Qq1NPBUPehKBjsbbpUtoYtqL0AgGzTOdinlnjqe50u21hz9L/yA9ol2aDQ7RPTePSo49XV8VU5nKUfhp23Ms/v2RYNtok/k+Mgj/n3zVNsNGkzB89FbpwHXPBXG6JS9ZjwYrq6pyo2a3G8CcosC3ROV9ZRCvUJks/7MB6mZ+d8ZqqN+gapAMh"
                                //                     //           "5IbwartAqNNBwdAwaustDa1KlcoKNFjBu0C5RmzNAYdonvuWSwrTfjc/xPN1LeWvbYfd5KvOCnm0rwqxFbXvnWTn+TuSkbM9j/gPzFBPNTRlykPnnIh/OAxnywZ6iGCea0J5Tm9sn1GRHUfB6wILwKqS9ZjUF2cNkbwtnaKvcoB3b25BOfYcacdpjXlBaORquXHFBq/BAw9GBhsUG7RK0S9KIb7mk5ikw7XfjcbzsIAlL3U6qBzZpjM/2Ap3gLxPu6DmpOlTfaQhJTsRXFkySPOY/ifLaRfv8Mu2U1JcVMk4unAdWyIcV4mEPO+Nl+JAP9qDbQ/DCTUwUDfWAVcX5wySUZ+7kSfJs+ZuV4S/JecnAuDDZG48nPKDF/Upvf2V/MWZ7zAuslXxQelrN7pSgVSSg4ehAwyKDdgnaJenEakuUdmz3y1Eumfa7GTyeJ5o7ODrnc3z2CfNs81Ce/sSm1qz6efk6UR7zn0x53YfP3aC13EQ0TXUF6u+JMDU1RRNOQqGA3n2gRfxA09GBhqMDDUen6BrChpIHGocHWoUHZRfyj/wnm//cfW0BAAAAAAAAAAAA8QLnAQAAAAAAAAAAAAKB8wAAAAAAAAAAAACBwHkAAAAAAAAAAACAQFIxYSIAAAAA0kXRJ50CAAAAskbSdTe+tlAwoHcfaBE/0HR0oOHoQMPRKbqGsKHkgcbhgVbhQdmF/CP/yeYfwxYAAAAAAAAAAAAQSE6dB03anF2meket+tGp0/LsLM3al+U6Bf+Mz23/zabYAkAcOG1recCAYXuhMT7bHaov9/cNag3MGsIejYSoY5qb/vtAXkCbBKQJc/03XLlktvNOfVmcUx0j7T3EczE2zM9SNF3CtzPSoUvc+deEtQvbuVNfjpm0MmuZaboTJokkXN6Y6c7MLHV3r6sNflze6M4s7XZNh/W53N2YEefeuKzW1bUinWOypOCWp4Z0aXG9u7tktyVrfalnxNmwvdRoani2pXY9LS1t+1pPlmxomG57zJId2u0OGqaHOPMv7yvaJAMU3caiELs9BtR/w5ZLRjtn++7tV22eMM9FRIbTyvwsXd9dsq2r9NuOd2PSuUfMuqQl/xqTXcjzxliOJV+umLQya5kk4yhXcxZ5YHl6qg21aqBzdEg0N0vTat1I8xI1qExbZxbUBqKFM1tUbu3Twdg9hCBXNM9TrSVsa7uq7HGaqmsr1Kqdt7yVs"
                                //                     //           "L1IBD7bnTrtNOxaLtCZrTK19g9CetGLQaCGsMdQhLHDxUp/LzTMG2iTgJRhqv+GKpfC2Lk4RhywUt+jqjh1p75ONWG7ZbV34hifpSadr7VoZc3ZRqPGJauN5iZ0OyMlusSdf0k4u+DzUuC1U4ZJqwKUy/lyHvANW6nT0YG4SWpTEJ12i8qlfgFpZOEcHR1ZD3gYZHjPpvOxkqE5vE0ULMuzm1TvheqokBa53R7qMkuuU4DcMkezdtuaLgk7PqQjLmwi2l7RCXy2p6u0By2NBGoIewxFoIadNrXKi2Rro8M28wbaJCBtmMqYYcolo51z+H6VDrcO6Bz3p4RNrdfmqL69aO1OA6ZnqXMkWmNlcjyeCydoRXQTL3k9D6HK8hTpEnf+mQh2kan2hEmrArSP8uU84Bsmn8AwNOkSe8P2122VYvQxKc3ztcGCVrFwwu2V69DBfotWTug0NqjWXhNGdiSWc7TAlXRlnxYPeF0t4qE7rKKyLgbKUaDhSlz81/bxVAbZXrGJ+my7PepgmPIR9ugmWMPeW+bmpud+kAPQJgGpx1n/DVUuGey8uVmh2lyd9mRvSnQY12s0Vxf2Ze1OLY5nSbbHXC94IjHYzki7LiPnP5JdOMlae8KU3qzlx0Rxv7YgvWiCxW1bpViinQiVNXvsqxyW1As1d+H2ynUOaL+1Qr16WtCvtDXut8/svTyyvJIgv0hbaVHtfM9YqL7DLUlvjLZXZEI/2+z15oZRlRrlLbJFmIGI5SPs0QODhvyWmRpVmr10or+/TlTFpInFBG0SMFa867/Yy6XmJlUPt+hAGYwMyxcdxrTbT5Q67dDx1seNTzsj5brEl38fXPm3k7X2hCm9WctPGIrrPFAVoMPjNT0rqsmAEBwbbAwV9iKqcUreWGOcGuqEnYN9aq2csHkVXSFAIk1rKw2qam8vXPsFYoHOiRp6hSttef/XidY41MtlI4JwtldgQj/b01TdU42jtTZVIjTSc0+E8hH26EMYDUVj0tF44s5dq0Y9HyIoDmiTgLESUP/FVS5x5EqVqL6nOk06LD8tPWQfotZpc4Gv4z10Trku8ebfA3f+bWStPWFKb9byE5biOg8M8A3vh2w5P7HC4wYrNaKtA7P3fbqySGUZJugOD/Rm4ZwqZBwdyXx0aoI0BQw7EPT99y5ootgeiID7jRwIBexxeKZLZSs8WK0DEATaJMlS6PaJrf6Lr1xq0qYc8tIPw5fOKnGdnjNKGC0PzaxV0jMMxvdZss9BNSxK52qKdUk0/5JBu9BkrT1hSm/W8hOF4joP5HgurwrQ8rxPV/dUhWkt+m0AVzDVxgrVw06GMV2hxbIolOuD4YHB6I6kqLBz0qnx0xQI2BPr+g6urFBsY6Qi215RMTzb/vtBD5OGAtijAVMdMzvnGn+ucb39BcUAbZKJUpj2iaH+i6tcam7KV8sOm3RrbE2kV05N5yrwWZJRQK45qOSs+j"
                                //                     //           "7PkI/OPBi1vLWdSl1izb8PXnbBZK09YUpv1vITleI6DxbO0BZXoPYnmx+EoAktZGgRe5GiTGgyTZXFMjVqNVd4oAdehY0cB4nGZO6RDTrbnAfS1lr9yXWGsr2CYnq2ffdj3oMeJg1hj2ZC2uGOzWPYqe8E10Egv5jsxQu0SUBUTPVfDOVS+/wy7ZTUFwSygvFZWiA53+iOnvtBzUvl9wx56Cw7zqKzvZ3G3mTc+ffA1y6y1p4wpTdr+RmG7oRJJAnXd7tLM0vd3etqXXK9u7s0011ybLzc3ZiZ6c7oZWlXHOXP9d2l/rGuZeOyOsgLmR7XMZ5pFFzecJ3b45gRSMEtTw3p08Jpj3Z7Gdr2xkx6NDU921Z54L9/cmRBw7TbI+xwdIpeV8Saf7RJPCm6jUUhXq1M5c6Q5ZKwIXl82ErAz+ZGZBitwj5Llzds+4z5dOko8hpWx1F0SU/+FQa7iLs9kXS5Ykpv3PmJyjjK1Sn+n7jQxJiamuJcqrWc0uHPHbVpjT99pDZNikLoHRJoET/QdHSg4ehAw9Epuoa5zn9K2iR4TsMDrcKDsgv5R/6TzT8mTBwDPHadts7kN3wFAAAAAJkAbRIAAADDAudBkrB3f3aWKvuL6RzjBAAAAIBigDYJAACAEcGwhYIBvftAi/iBpqMDDUcHGo5O0TWEDSUPNA4PtAoPyi7kH/lPNv+IPAAAAAAAAAAAAEAgqYg8AAAAAEC6KPrbGwAAACBrJF13Y9hCwYDefaBF/EDT0YGGowMNR6foGsKGkgcahwdahQdlF/KP/CebfwxbAAAAAAAAAAAAQCAFcR40aXN2lmZ7y6bYYqJD9eX+b5brHbUd9IFG8eK000E9nXrPLtfFFuCJmlW8p5VbL9N+EEIjPP9GImoIGywKaJMkD/Tyx6TNsOUS2/UyBUndqS/3zyuXMLY/LsI+l+Z8WoS3QUsXdU5Zb4Q5f9yY89/ctO032kXe8h/WPjRZy38EuhMm+SRc7m7MzHRnNi6rdbFlQ6wv7Xavq3Uv5DG931jnWNoN+kU2iFPvrGuUAvO3cb27u2S3S2u9r6d7fzg7Hjep0fTyRrA2pv0TJCsapvn5z4aG6X6m01U+jp/k8o82iSZJG8ubXnFqFazN8OWSPG5mqesn8/XdJbHffu3w547CcFqFfy5N+dTI48LYINcTvfMp/UOc34+k8i/vX29dpdN2vJt85T+8fWiylf9oJH8FA4ln0nFTFNd3u0tBN8Zjv/OhyS6x6Z0DjcbxgIXGy07ltg1R5Ai8bNZkxxMgLZpKWwyo1Ez7J0kmNEz5859VDT23TYhUlY8TILH8o03SIzGNc6hXbFqZtPGyRZN96o6VXPyO08dEPXd0htIq1HMZJp8Kk849rHPqasI6ZmkkTZLJvzOdEnsb1U3e8h+13M5a/iOS/2ELC+fo6GiPqtNqPQzTVdqL8BsZxrPpDF6RISi8TYafbFK9F6qlwlw8wlldp0g30CgB5mjWrud0icp0SEdpDl1KKZ12i8olf+M07QcGjSI+/0UFdgYGQJskeaCXP0mU3c1L1Fip09HBlmizeMHh21U63DqIbvvjIsxzacynjVA693U5t8CrdVqvzVF9e9HaPU5M+e8cidZomRzV2cIJWqEGXfKy+7zlP2q5nbX8R0U5ESbGJJJgCjUZxMPjZmfA+2aFncjjpfdJXM/+Yy9vlTrO9xoxkZze2dMoBebfx8urKbfp/KpQJpvdRrfj5EmHppYtLi0tSf2sxW57pv2TJRsaujE8/2MmGxqm+5lOVfk4AcaZ/6K2"
                                //                     //           "Scancfb1Sk4rtzYjlEteugjk732ESaLMi0sr37T55DOYQRt06uK2uajn75NI/geeEcbwXDnIeP49MO13kr38B5H8FQyMI5N2ZEhI6JuiClFxw4MNxGUU8sarh0z+7TQYx/4xE7/e2dVo3LYXjKWPuyBhXe26yMKGj+MldKE1PlKhqbInx9gyD3vz3T9hMqFhj7DP/3jJkoZpfabTVT6On3Hlv8htkuQ1zo9e8WsVrM1Q5ZLUxWXL3On0+X002w9PHFoFps0rn7746OzSRV5PG1mk8w+SSP4DnAee4/h75CT/Lkz7+2Qz/yaSv4KBcWRSY91sVyUQFs8Hp4/9xocxAkfBPFSChiNRvTOm0ThtLxzKgSAXocdluy5+zoXxNmBMpE9TjatxOIBp//jIrIaG53+cZEPDdD/T6dVwPIwj/0Vvk4zVxjKuV6JaObQZoVxyayXXvX83ku0bGFUrY9p8bMKI1tmti+f6EOdXJJJ/z+cnYrspy/m3MbTtZiT/YSjIpxqtMW2VGtHWwZE1tkRhfR6jP2bN91MaQWN7BNOVRSo3LlGTOnSw36KVE7aLeLBw7oiOjnip00qjqq5v+uxHyoFGI7JA52R+eXGNleKxdkLdes94p6m6zePuMCcCSAmG5x+4wDNdaNAmGTPQyx+7NrGVS03arOzT4sE50bJx4mf7aSDRtCmdqy5dOgf71OLt+rkXCWiJ/2qV8c+j4Zv/OObgynL+FSPZRwbyH5ZCOA+4Mq42RGHoMXnFdHVPVQDWsscHNDejVwLTFVosi8K3fkD7rRUy1Ds2dIdRVEDCeDLT8IZG8SInX3J+11UWKOVFqoSdoAVY+NqmmuzHtB+MoCHoATsDPqBNkjDQy58xld3NzSpRfdC+g2x/0sSaNh+dG2Ipb207zu9+5q0JGctjd64E5n96luZEh7Ztdx4oR5Pns5K3/Asi2UcG8x+F/DsP5OyV7CUa9H76snCGtrgSsd91fkjKW3TG9yTTVFksU6NWo9bKieBreRmV10ymaQYaxYtsuLSodl7lWNpti1bWqkI1gfZY2tyQzfNCRzgXBvG1TaWVaT8YQcOg579gGDXEM11I0CZJHujlj0mbGMql9vll2impGeTtDGP74yLutHnoLB0qQt1tY89zAhjzv0AnVkTnd6dOlv+gQ/Ud0RX2e1bylv+o9pG1/EdFDV+YGEknQY9N8VqCx6vYJrngxT7RhR9ynIrrvH5jV+TYF9v5RxjfEoV49c62RikwfxdqrKFaBu3TuT+U3mMmPZqatEqvltnRcIjnf0zADkcnfeXjeEkq/2iT9EnWxvKlV7xambQZslwSWsnjfQx5eNuPxjBaRUqbn00M4NJZ/CasjuHO702S+Y8210d+8j+c7WYn/1GZ4v+JC02MqakpzqVayzidOi1X2rR2lEKvqmLieqdIo1zZXkqApqMDDUcHGo5O0TXMRf5T3iZJncYp1gtlWnhQdiH/yH+y+S/MhInjgMeo09aZ1DoO0gA0AgAAAJIH9W00oBcAAJiB8yAO2Fs9O0uV/cV8jGVJAmgEAAAAJA/q22hALwAACA2GLRQM6N0HWsQPNB0daDg60HB0iq4hbCh5oHF4oFV4UHYh/8h/svlH5AEAAAAAAAAAAAACSUXkAQAAAADSRdHf3gAAAABZI+m6G8MWCgb07gMt4geajg40HB1oODpF1xA2lDzQODzQKjwou5B/5D/Z/GPYAgAAAAAAAAAAAAIpiPOgQ/XlWZqdtZblekdtD4mciXeZov6sUECjEWjSpo92zc2+3c4u14Ul+wD9najZs3va2fVrbjq325bNpvw1YII0dAP788X0DId+xkGOQJtkrECv+AjU0r8tkw04/bbyeHZTbLFj2u+HWZdOfdl23ijnjpOw+Yt6n8PmXx0zsefVlP9hy+2s3P8Id"
                                //                     //           "CfMOJJweWOmO7NxWa91N2Zmuku719W6ievd3SXx+5mlbuifpJhk9M6mRikwf4m0Tw/tru8udWeWdoW6cs3SuGfHdtKjf1o0FaLatDMj70GE45Mkexqm7/lP07Ntr2vcdhb+GR8/qbHDCZFk/tEmsRiPjeVDr3Q8j8Fa+rVlxs1wWlnPob38dZbXpv3+mHSR9cCQ5/Yimfz3MeXHjfF4bmv09o/+vCaVf7ne2x++3DblPx33Pxr5jzzo1GmnUaatMwtqwwKd2SpTa/8g1BueTn2dalQW/wE/oNGwWF7OakOtOmjS+VqLVtaqZH11epqqaytEjUsD3kjoP0jn6JBoblZpZ6C5Ke6BKCO2tdaACash7M8HVfcsVvoKLpzZonJrnw5k5RP+GQc5Am2SsQK94sNfy6C2TEZoXqKGyFn/uXSV16b9noTRxaoHKPK5YyZU/qLe53D53xQHrNT3qCoqwok9r6b8D1VuZ+j+RyT/zoPpKu0dWUYZGWEs67U5qm8vqg3eyLBTV7yzDEHhbeIcy7ObVO+FpKhQFLndHqKS0ZBpaDQ8XFit1OnoQBQSalOPzhEdiq0lu90unKAVUbxdsmsQUv+i0Wm3qOwQz48O1XdEyb6yNlwZkWNCaQj786fTplZ5kWy+A2d9FPYZB/kCbZLxAb3iI0jLoLZMVlg4R0dBz6VpvxdGXTgMvkqHWwfRzx03YfIX9T5HyP857jeHfF4TwZT/YcrtLN3/iBRwwkT32x4/xE1dr9Fc/Rz1fUHeLJxwvy3q0MG+uMYJ/csG1dprwjiOxCLOx5VOZZ8WD3hdLcK4DqtZq3yg0UhwYSVLTA+440FzNBtopOH1LxZNusSe3v11W8POZ/xY8zzVWk6PL2DCaAj7C6IXueGYY8OmYahnHOQftEmSAXrFh0HLoLZMhmmerw06gG2Y9pt0aW5WqDZXpz2PXqPx3GNgIA1R73Ok/KevPRF8D0KU2xm//0EUyHkgDFNOdFGlRnmLTH0FGTojbmqo58T9tqhzQPutFerVO4J+JaRxNRqlV+so3PVSAjSaDIdHVhxTJP2LhHyjK1jctjXsSrTj4UBocg8ZUQeDhNAQ9hcMR25Qo0qzl070NawTVUNMiqifcZBn0CZJEugVH0Us6znyJGg4o2m/ER4uebhFBx6ijnzuGEg8Da78p83G/PMfrdz2JeX330SBnAfTVN1TDbi1NlX83kQyOnQmtBVbY18aqubpHOxTa+WEzXvmCk0VlczaSoOq+m1UFl3V0GhizHGLJbL+BUI14hze3OlZ0dRzh4Nbb9cHG4XAqCHsLxyiceFoHHAnpVWj84biTD7jIOegTZIY0Cs+CljWc+etwm+V1Th8N6b9RoSmy1Wi+t5g53Dkc8dA4mlw5z9lNhac/wjlth8pv/9hKOCwBYHNy8w3ygontRb+9IasOMT+XsVQqYn1FtUq/iFp05VFKsuwN3e4mzcL55TxHdVphd9OyWsNYYQTAholzHRJNFcOye8F5DD6Axc8Hk2UBPAdRAf2Z2a6VGYvwEDjoIfhGQcFAm2SWIFe8VG0sp7nvxBZpK0D7ygS034zTdqUQ14Gw/NHP/foJJ+GwfynycYi5d8dsRSKdN//0KivLkyMxJMgPwGy0e1/AIOxPrFh+ypGMNd3u0vGz4ZYnxfZ2OVjbdcL9VsmYpqGJDG9M6hRCszfwjP/Hnn1tGVFaA2TJRWa+j7zTn2cn8lLD1nSsEdK7E+TDQ0jPuNjJjXl44RILP++dhGhbstgfevF2GwsB3ql5nkM0iO0VskyrFbWJ/P8y1/Tfl9suvAn+LxsZOhze5BU/ntEvc8h8u9gRDtKJP+jlNsZuf9RyH/kwcIZ2iq7PEP8xnGUsSqeTFNlsUyNWs0V7uaBnEDL5aH2mnk7d0Cj8CyQnMNpR4+P7qivAhh0AwHPvHPy"
                                //                     //           "GTkmPeznHItGSA1BAErDnXo/tKBT37FpiGe8kKBNklKgV6GRofP81tdnwj7T/hC0zy/TTkl9WcBODOcemTGkwTf/acCU/xjK7VTf/4gUYNgCj085oNKOCofhZadEBx5jTUZFhr2Jf41jqHkGTp44S6dHhulwGEu6x7jEATQKD4dF1udqVJH5t2ZlzeOMxvHDz7w0nr7tDDzzHeLJ8Mto6fkQRkMQjFX3LO5XehpW9hcdGuIZLyJok6QV6FVcrNB5K1S+d0/VwqHzpv0m+LcNWvOcWX/Uc8dB0mkIyn8aMOd/tHI77fc/KlMcfqD+nghTU1McX6HWMk6HP9/TpjX+lI/alDYmrneKNMqV7aUEaDo60HB0oOHoFF3DXOQ/5W2S1GmcYr1QpoUHZRfyj/wnm/9iTpiYEOw9oq0zmQk7mQTQCAAAAEge1LfRgF4AAGAGzoM4YG/1rBWSuo2YNW+gEQAAAJA8qG+jAb0AACA0GLZQMKB3H2gRP9B0dKDh6EDD0Sm6hrCh5IHG4YFW4UHZhfwj/8nmH5EHAAAAAAAAAAAACCQVkQcAAAAASBdFf3sDAAAAZI2k624MWygY0LsPtIgfaDo60HB0oOHoFF1D2FDyQOPwQKvwoOxC/pH/ZPOPYQsAAAAAAAAAAAAIpHjOAzmr7jLVO2rdDzX77qx9Wa6T6WeFAhrFRJM2A23Sf39zE9p7YrRN1rS/b9lYIBQQk4Z4/kMR/Iw67XB2dlNsAYVCPkdok8QO9AqHp/11qL7c1y18/Whqy/DllsU51TFhbX9smMrjvOsStj4y58civF7Zyr8gUhrD3v+Q104D3Qkz3iRc7+4uzXRnZpa6u9fVJj8ub3RnlnbFL/JFrHpnXKMUmL/k8kawTfrtv767ZNNf2fbGZbk2KdKiabBtKq1c2i0ZC4XxkA0NBSl+/tP0bNvtSj7LPc0udzdmnM+sc/9kSY0dTojx5L/YbZJENc6ZXslo5W1/shzqlUtWORWmfvRrq/Tge9LbH8H2IzKcVubyOCu6JJV/jTE/itB6ZSz/UdNo0ku25UNf20yi5aqiUJEHnfo61ags/jPTOTokmpslfPHXH2g0KpaXs9pQqwME7W/S+VqLVtaqSv9pqq6tEDUupdtbOSYCbbN5nmqtMm1tO7Vr1c5DOxum5xvPv4FOnXYaZVqs9BVaOLNF5dY+HfAbiOYlaojaaOvMgrVT4NgPcg/aJMkBvcx42p8qt/rl0gKd2SpTa/8gIGrD1JZhxDHigJX6HlXFTYli+2PBVB7nXZdQ9VGY/ChC65Wl/FuET2O4+89teQp57bRQHOeBMOT12hzVtxfVhmA67RaVS+GqHRmWuunsdsgQFN4mrrs8u0n1XkiKCkWR2+0hKrPkOkXqgUYjwoXVSp2ODkQhoTY5CNrfOaJDsdUh/8IJWhHF36U8aTQkZtuco1n77umSUPOQjlJaUE8Ck4ZRnv9C0mlTq7xINt+BsLMq7R1ZjSRaOEdH+m9QPNAmSRToZcDP/uxlVFhMbRkZvl6lw60DOsf9I79rTxJTeZx3XcLUR8b82AilV8byz0RJY4T7n7W2QEGcB+IGrddorn6O+n6dIJp0iT1F++u2isF//MnCCfcb3w4d7Ldo5YS+WoNq7TVhHEdiEWkQxrdc2afFA15XizCuw2qWKh9oNDJcWMkS04eg/dwxcXeAgSKMbbocBVLPFrXhPFCYNIz2/BeR3pvP5mZojZrna4MOB5BD0CZJFugVTBT7c0c5emBoyzQ3K1Sbq9Oe7B1Ftf3JEVwe51+Xgfyb2qyBDOqVufxHTWOk++8k7W2BQjgPZIiJuEGhbV6+1RUsbtsqhhLt+FU+7je+nQPab61Qr94R9CshjfvNJ3vpjsKncdJAo9RyWPTX5ybblLbYotr5njFSfYdbmqCHScOoz38B4Tef1KjS7KUTfY"
                                //                     //           "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"
                                //                     //           "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"
                                //                     //           "AAABAJpIHAAAAAAAgE8kDAAAAAACQieQBAAAAAADIRPIAAAAAAABkInkAAAAAAAAykTwAAAAAAACZSB4AAAAAAIBMJA8AAAAAAEAmkgcAAAAAACATyQMAAAAAAJCJ5AEAAAAAAMhE8gAAAAAAAGQieQAAAAAAADKRPAAAAAAAAJlIHgAAAAAAgEwkDwAAAAAAQCaSBwAAAAAAIIPZ/wcq9huE86yOpAAAAABJRU5ErkJggg==' data-filename='Tops.png'></p></div></div></div>"
                                //                     //     )
                                //                     // )
                                //
                                //                     InteractiveViewer(
                                //                       child: Html(
                                //                           data:
                                //                               " <img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABA8AAAKICAYAAAAfJdOBAAAAAXNSR0IArs4c6QAAAA"
                                //                               "RnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAO+uSURBVHhe7P17lCTXVeeP7pJkyZL8fgK2f3"
                                //                               "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"
                                //                               "MpE8AAAAAAAAmUgeAAAAAACATCQPAAAAAABAJpIHAAAAAAAgE8kDAAAAAACQieQBAAAAAADINHQYie+fuKGhofgeAA"
                                //                               "A4S07xzwMAAHAGUXkAAAAAAAAynWrlAQAAAAAAOPuoPAAAAAAAAJlIHgAAAAAAgEwkDwAAAAAAQCaSBwAAAAAAIBPJAwAA"
                                //                               "AAAAkInkAQAAAAAAyETyAAAAAAAAZCJ5AAAAAAAAMpE8AAAAAAAAmUgeAAAAAACATCQPAAAAAABAJpIHAAAAAAAgE8kDAA"
                                //                               "AAAACQieQBAAAAAADIRPIAAAAAAABkInkAAAAAAAAykTwAAAAAAACZSB4AAAAAAIBMJA8AAAAAAEAmkgcAAAAAACATyQMAA"
                                //                               "AAAAJCJ5AEAAAAAAMhE8gAAAAAAAGQieQAAAAAAADKRPAAAAAAAAJlIHgAAAAAAgEwkDwAAAAAAQCaSBwAAAAAAIIPZ/wc"
                                //                               "q9huE86yOpAAAAABJRU5ErkJggg==';cursore:zoom-in>"),
                                //                     )
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //             actions: [
                                //               ElevatedButton(
                                //                 onPressed: () async {
                                //                   Navigator.pop(context);
                                //                 },
                                //                 style: ElevatedButton.styleFrom(
                                //                   padding: const EdgeInsets
                                //                       .symmetric(
                                //                       horizontal: 20,
                                //                       vertical: 2),
                                //                   backgroundColor: Colors.black,
                                //                   shape: const StadiumBorder(),
                                //                 ),
                                //                 child: const Text(
                                //                   "Ok",
                                //                   style: TextStyle(
                                //                       color: Colors.white,
                                //                       fontSize: 18,
                                //                       fontWeight:
                                //                           FontWeight.bold),
                                //                 ),
                                //               ),
                                //             ],
                                //           ));
                                // });
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.009),
                                child: Container(
                                  color: AppColors.colorLightGrey,
                                  height: screenHeight * 0.040,
                                  width: screenWidth * 0.070,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/sizer.svg",
                                      height: screenHeight * 0.030,
                                      width: screenWidth * 0.050,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      width: screenWidth*0.80,//80.w,
                      child: Text(
                        "${shopController.apiShopProductDetailMap?["data"]["product"]["product_name"]}",
                        style: GoogleFonts.puritan(
                            color: AppColors.colorLightBlack,
                            fontSize: screenHeight * 0.025,
                            fontWeight: FontWeight.bold),
                        maxLines: 5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  const Icon(
                    Icons.star_rate_outlined,
                    color: AppColors.colorLightBlack,
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  Text(
                    shopController.apiShopProductDetailMap?["data"]
                                ["averageRating"] ==
                            null
                        ? "0.0"
                        : "${shopController.apiShopProductDetailMap?["data"]["averageRating"]}",
                    style: GoogleFonts.ruluko(
                      color: AppColors.colorLightBlack,
                      fontSize: screenHeight * 0.016,
                    ),
                  ),
                  // SizedBox(
                  //   width: screenWidth * 0.020,
                  // ),
                  // Icon(
                  //   Icons.share,
                  //   color: AppColors.colorLightBlack,
                  // ),
                  SizedBox(
                    width: screenWidth * 0.020,
                  ),
                  InkWell(
                    onTap: () {
                      //${shopController.apiShopProductDetailMap?["data"]["product"]["product_name"]}

                      // shopController.addToWishList(
                      //     "${shopController.apiShopProductDetailMap?["data"]["product"]["id"]}");

                      SQLWishListHelper.createItem(
                          "${shopController.apiShopProductDetailMap?["data"]["product"]["product_name"]}",
                          totalPrice.value.toStringAsFixed(2),
                          "${shopController.apiShopProductDetailMap?["data"]["firstSizes"][sizeIndex.value]["product_size"]["id"]}",
                          "${shopController.apiShopProductDetailMap?["data"]["product"]['id']}",
                          "${shopController.apiShopProductDetailMap?["data"]["colors"][currentColorIndex.value]['id']}",
                          "$productQuantity",
                          "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductDetailMap?["data"]["product"]["featured_image"]}");

                      refreshWishList();
                    },
                    child: wishList.isEmpty
                        ? const Icon(
                            Icons.favorite_border,
                            color: AppColors.colorLightBlack,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: AppColors.colorLightGrey,
                          ),
                  ),
                ],
              ),
              DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.070,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                            // color: Color(0xffE5E5E5),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.colorLightOrange,
                              ),
                              insets: EdgeInsets.symmetric(horizontal: 0),
                            ),
                            isScrollable: true,
                            dividerColor: Colors.white,
                            tabs: [
                              Text(
                                "Description ",
                                style: GoogleFonts.puritan(
                                  color: AppColors.colorLightBlack,
                                ),
                              ),
                              Text(
                                "Reviews ",
                                style: GoogleFonts.puritan(
                                  color: AppColors.colorLightBlack,
                                ),
                              ),
                              Text(
                                "Questions ",
                                style: GoogleFonts.puritan(
                                  color: AppColors.colorLightBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 2 - 200,
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Html(
                                          data:
                                              "${shopController.apiShopProductDetailMap?["data"]["product"]["short_description"]}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ListView.builder(
                                  itemCount: shopController
                                      .apiShopProductDetailMap?["data"]
                                          ["productReviews"]
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      "",
                                      style: GoogleFonts.ruluko(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.016,
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ListView.builder(
                                  itemCount: 19,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      "",
                                      style: GoogleFonts.ruluko(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.016,
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),

                    // Obx(
                    //   () =>

                    sizeList.isEmpty
                        ? Visibility(
                            visible: false,
                            child: Container(
                              child: Text(shopController.count.toString()),
                            ))
                        : Container(
                            //height: screenHeight * 0.06,
                            width: screenWidth * 0.33,
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: InputQty(
                              textFieldDecoration: const InputDecoration(
                                  border: InputBorder.none),
                              boxDecoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              maxVal: double.parse("2"),
                              initVal: 1,
                              showMessageLimit: false,
                              minVal: 00,
                              steps: 1,
                              isIntrinsicWidth: false,
                              borderShape: BorderShapeBtn.none,
                              plusBtn: const Icon(Icons.add),
                              minusBtn: const Icon(Icons.remove),
                              btnColor1: Colors.black,
                              btnColor2: Colors.grey.shade100,
                              onQtyChanged: (val) {
                                totalPrice.value =
                                    netPrice * double.parse("$val");

                                productQuantity = double.parse("$val");

                                // if (kDebugMode) {
                                //   print(val);
                                // }
                              },
                            ),
                          ),
                    // ),
                    sizeList.isEmpty
                        ? Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          backgroundColor: Colors.white,
                                          content: StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Request for Stock",
                                                  style: GoogleFonts.poppins(
                                                      fontSize:
                                                          screenHeight * 0.018,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.020,
                                                ),
                                                Container(
                                                  width: screenWidth / 2,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffC4C4C4),
                                                        width: 2),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Enter email"),
                                                      maxLines: 1,
                                                      onChanged: (val) {
                                                        emailForStockRequest
                                                                .value =
                                                            val.toString();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.020,
                                                ),
                                                SizedBox(
                                                  width: screenWidth / 2,
                                                  height: screenHeight * 0.060,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      Navigator.of(context)
                                                          .pop();

                                                      print(
                                                          "network callllll start ..........................");

                                                      await shopController
                                                          .requestForStock(
                                                              shopController
                                                                  .apiShopProductDetailMap![
                                                                      "data"][
                                                                      "product"]
                                                                      ["id"]
                                                                  .toString(),
                                                              emailForStockRequest
                                                                  .value);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20,
                                                                vertical: 2),
                                                        backgroundColor:
                                                            AppColors
                                                                .colorLightGrey),
                                                    child: const Text(
                                                      "Continue",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          }));
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 2),
                                backgroundColor: AppColors.colorWhite,
                                shape: const StadiumBorder(
                                  side: BorderSide(
                                      width: 2, // thickness
                                      color: AppColors.colorLightBlack // color
                                      ),
                                ),
                              ),
                              child: const Column(
                                children: [
                                  Text(
                                    "out of stock",
                                    style: TextStyle(
                                        color: AppColors.colorLightBlack,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Request for stock",
                                    style: TextStyle(
                                        color: AppColors.colorLightBlack,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Obx(
                                () => CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.colorLightGrey,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    height: 40,
                                    child: Text(
                                      selectedSize.value,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: AppColors.colorLightBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Size",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                        255, 130, 130, 130)),
                              )
                            ],
                          )
                  ],
                ),
              ),
              sizeList.isEmpty
                  ? Container()
                  : ListTile(
                      title: Text(
                        "Total Price :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: const Color.fromARGB(255, 130, 130, 130)),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text(
                                totalPrice.value.toStringAsFixed(2),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.black),
                              )),
                          ElevatedButton(
                            onPressed: () async {





                              SQLHelper.createItem(
                                  "${shopController.apiShopProductDetailMap?["data"]["product"]["product_name"]}",
                                  totalPrice.value.toStringAsFixed(2),
                                  "${shopController.apiShopProductDetailMap?["data"]["firstSizes"][sizeIndex.value]["product_size"]["id"]}",
                                  "${shopController.apiShopProductDetailMap?["data"]["product"]['id']}",
                                  "${shopController.apiShopProductDetailMap?["data"]["colors"][currentColorIndex.value]['id']}",
                                  "$productQuantity",
                                  "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductDetailByColorMap?["data"]["images"][shopController.ImageIndex.value]["image"]}");




                              Get.to(() => const MyBagView());
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              backgroundColor: AppColors.colorWhite,
                              shape: const StadiumBorder(
                                side: BorderSide(
                                    width: 2, // thickness
                                    color: AppColors.colorLightBlack // color
                                    ),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: AppColors.colorLightBlack,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.015,
                                ),
                                const Text(
                                  "Add to bag",
                                  style: TextStyle(
                                      color: AppColors.colorLightBlack,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              Visibility(
                  visible: false, child: Text(shopController.count.toString())),
              SizedBox(
                height: screenHeight * 0.030,
              )
            ],
          ),
        )),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shopController.getShopProductDetailByColorData(
        "${shopController.apiShopProductDetailMap?["data"]["product"]["style_design_id"]}",
        "${shopController.apiShopProductDetailMap?["data"]["colors"][0]["id"]}");

    refreshWishList();
  }

  // Future<void> getShopProductDetailByColorData(
  //     String styleID, String colorID) async {
  //   print(
  //       "Product ID.................$styleID\n Color ID............................$colorID");
  //
  //   isShopProductDetailByColorLoading.value = true;
  //   print("response shop detail By Color start point ............");
  //   var response = await http.get(
  //     Uri.parse(
  //         "${BASE_URL}api/product-color-wise-image/${styleID}/${colorID}"),
  //   );
  //
  //   apiShopProductDetailByColorMap = jsonDecode(response.body);
  //   isShopProductDetailByColorLoading.value = false;
  //
  //   print("response .....shop detail....... for product" +
  //       response.body.toString());
  // }
}
