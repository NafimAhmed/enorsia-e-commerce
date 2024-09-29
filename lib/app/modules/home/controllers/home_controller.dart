import 'package:get/get.dart';

import '../model/banner_model.dart';
import '../model/categoryBannerModel.dart';
import '../model/category_model.dart';
import '../model/featured_product_model.dart';
import '../model/product_model.dart';
import '../model/slider_model.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  var isLoading = false.obs;
  var isBannerLoading = false.obs;
  var isFeaturedProductLoading = false.obs;
  var isTrendingProductLoading = false.obs;
  var isCategoryProductLoading = false.obs;
  var isCategoryBannerLoading = false.obs;
  var categoryBanner = CategoryBanner().obs;
  // var trendingProduct = TrendingModel().obs;
  var categoryProduct = CategoryModel().obs;
  var featuredProduct = FeaturedProductModel().obs;
  var banner = BannerModel().obs;
  var slider = SliderModel().obs;
  var homeTopList = ProductModel().obs;
  var homeMiddleList = ProductModel().obs;
  var homeBottomList = ProductModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchSlider();
    fetchBanner();
    fetchFeaturedProduct();
    // fetchTrendingProduct();
    fetchCategoryProduct();
    fetchCategoryBanner();
    fetchHomeTopProduct();
    fetchHomeMiddleProduct();
    fetchHomeBottomProduct();
  }

  void increment() => count.value++;

  Future<void> fetchBanner() async {
    isBannerLoading.value = true;
    try {
      await HomeProvider().getBanner().then((value) => {banner.value = value!});
      isBannerLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchSlider() async {
    isLoading.value = true;
    try {
      await HomeProvider().getSlider().then((value) => {slider.value = value!});
      print("from controller ${slider.value.data!.length}");
      isLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchFeaturedProduct() async {
    isFeaturedProductLoading.value = true;
    try {
      await HomeProvider()
          .getFeaturedProduct()
          .then((value) => {featuredProduct.value = value!});

      isFeaturedProductLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchCategoryBanner() async {
    isCategoryBannerLoading.value = true;
    try {
      await HomeProvider()
          .getCategoryBanner()
          .then((value) => {categoryBanner.value = value!});

      isCategoryBannerLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchCategoryProduct() async {
    isCategoryProductLoading.value = true;
    try {
      await HomeProvider()
          .getCategoryProduct()
          .then((value) => {categoryProduct.value = value!});

      isCategoryProductLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchHomeTopProduct() async {
    isCategoryProductLoading.value = true;
    try {
      await HomeProvider()
          .getHomePageTopList()
          .then((value) => {homeTopList.value = value!});

      isCategoryProductLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchHomeMiddleProduct() async {
    isCategoryProductLoading.value = true;
    try {
      await HomeProvider()
          .getHomePageMiddleList()
          .then((value) => {homeMiddleList.value = value!});

      isCategoryProductLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchHomeBottomProduct() async {
    isCategoryProductLoading.value = true;
    try {
      await HomeProvider()
          .getHomePageBottomList()
          .then((value) => {homeBottomList.value = value!});

      isCategoryProductLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }
}
