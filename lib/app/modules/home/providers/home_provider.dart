import 'package:get/get.dart';

import '../../utill/constant.dart';
import '../model/banner_model.dart';
import '../model/categoryBannerModel.dart';
import '../model/category_model.dart';
import '../model/featured_product_model.dart';
import '../model/product_model.dart';
import '../model/slider_model.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<BannerModel?> getBanner() async {
    var response = await get('${BASE_URL}api/banner'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );

    print("bannner.... .................1111${response.statusCode}");

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          print("bannner .................1111$jsonString");
          return BannerModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  Future<SliderModel?> getSlider() async {
    var response = await get('${BASE_URL}api/slider'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );
    //
    // print("document and book code  .................22222" +
    //     response.statusCode.toString());

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          // print("document and book .................22222" +
          //     jsonString.toString());
          return SliderModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  Future<FeaturedProductModel?> getFeaturedProduct() async {
    var response = await get('${BASE_URL}api/shop-by-category'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );
    //
    // print("document and book .................22222" +
    //     response.statusCode.toString());

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          // print("document and book .................22222" +
          //     jsonString.toString());
          return FeaturedProductModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  Future<CategoryModel?> getCategoryProduct() async {
    var response = await get('${BASE_URL}api/all-category'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );

    // print("document and book .................22222" +
    //     response.statusCode.toString());

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          // print("document and book .................22222" +
          //     jsonString.toString());
          return CategoryModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  Future<CategoryBanner?> getCategoryBanner() async {
    var response = await get('${BASE_URL}api/category-banner-images'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );

    // print("document and book .................22222" +
    //     response.statusCode.toString());

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          // print("document and book .................22222" +
          //     jsonString.toString());
          return CategoryBanner.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  Future<ProductModel?> getHomePageTopList() async {
    var response = await get('http://10.81.11.62:8000/api/home-page-top'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );

    print("document and book .................22222${response.statusCode}");

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          print("document and book .................22222$jsonString");
          return ProductModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  Future<ProductModel?> getHomePageMiddleList() async {
    var response = await get('http://10.81.11.62:8000/api/home-page-middle'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );

    print("document and book .................22222${response.statusCode}");

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          print("document and book .................22222$jsonString");
          return ProductModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  Future<ProductModel?> getHomePageBottomList() async {
    var response = await get('http://10.81.11.62:8000/api/home-page-bottom'
        // BASE_URL.value + "all-single-document",
        // headers: {'Authorization': 'Bearer $logInToken'}
        );

    print("document and book .................22222${response.statusCode}");

    if (response.statusCode == 200) {
      try {
        if (response.body['status'] == 200) {
          var jsonString = response.body;
          print("document and book .................22222$jsonString");
          return ProductModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
    return null;
  }

  // Future<TrendingModel?> getTrendingProduct() async {
  //   var response = await get('${BASE_URL}api/trending-list'
  //       // BASE_URL.value + "all-single-document",
  //       // headers: {'Authorization': 'Bearer $logInToken'}
  //       );
  //
  //   // print("document and book .................22222" +
  //   //     response.statusCode.toString());
  //
  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body['status'] == 200) {
  //         var jsonString = response.body;
  //         // print("document and book .................22222" +
  //         //     jsonString.toString());
  //         return TrendingModel.fromJson(jsonString);
  //       }
  //     } catch (e) {
  //       print(e.toString());
  //     }
  //   } else {
  //     return null;
  //   }
  //   return null;
  // }
}
