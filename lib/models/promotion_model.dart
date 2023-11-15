class PromotionModel {
  final int id;
  final String bannerUrl, promotionPageUrl;

  PromotionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bannerUrl = json['bannerUrl'],
        promotionPageUrl = json['promotionPageUrl'];
}
