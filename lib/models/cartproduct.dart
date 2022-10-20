
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