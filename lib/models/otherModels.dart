
class CartProduct {
  final String name;
  final String weight;
  final String actualPrice;
  final String discountPrice;
  final String quantity;
  final bool isVip;
  final String vipPrice;
  final String imgsrc;

  CartProduct(
      {
        required this.name,
        required this.weight,
        required this.actualPrice,
        required this.discountPrice,
        required this.quantity,
        required this.isVip,
        required this.vipPrice,
        required this.imgsrc,
      });
}

class OrderHistoryDetail {
  final String name;
  final String deliveredOn;
  final bool isDelivered;
  final String deliveryOn;
  final String imgsrc;

  OrderHistoryDetail(
      {
        required this.name,
        required this.deliveredOn,
        required this.isDelivered,
        required this.deliveryOn,
        required this.imgsrc,
      });
}

class AllCategoryDetailModel {
  final String name;
  final List<String> subCategoriesNames;
  final List<SubCategoryDetailModel> subCategories;
  final String numberOfProductsTotal;
  final String categoryId;
  final String imgsrc;

  AllCategoryDetailModel(
      {
        required this.name,
        required this.subCategoriesNames,
        required this.subCategories,
        required this.numberOfProductsTotal,
        required this.categoryId,
        required this.imgsrc,
      });
}

class SubCategoryDetailModel {

  final String name;
  final String mainCategoryId;
  final String id;
  final String numberOfProductsSub;

  SubCategoryDetailModel(
  {
    required this.name,
    required this.mainCategoryId,
    required this.id,
    required this.numberOfProductsSub,
  });
}