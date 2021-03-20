import 'package:my_app/heroes.dart';


class GoodsDetail extends ManagedObject<_GoodsDetail> implements _GoodsDetail {}

class _GoodsDetail {
  @primaryKey
  int id;

  @Column(nullable: true)
  int categoryId;
  @Column(nullable: true)
  String firstRate;
  @Column(nullable: true)
  String focusImg;
  @Column(nullable: true)
  String goodsCode;
  @Column(nullable: true)
  String goodsDesc;
  @Column(nullable: true)
  String goodsHeight;
  @Column(nullable: true)
  String goodsLong;
  @Column(nullable: true)
  String goodsName;
  @Column(nullable: true)
  String goodsStock;
  @Column(nullable: true)
  String goodsWeight;
  @Column(nullable: true)
  String goodsWidth;
  @Column(nullable: true)
  String lastRate;
  @Column(nullable: true)
  String sendCity;
  @Column(nullable: true)
  String transferFeeTip;
  @Column(nullable: true)
  int goodsId;
  @Column(nullable: true)
  int goodsType;
  @Column(nullable: true)
  int morePayStatus;
  @Column(nullable: true)
  int parentCategoryId;
  @Column(nullable: true)
  int platformOnline;
  @Column(nullable: true)
  int purchaseNum;
  @Column(nullable: true)
  int saleNum;
  @Column(nullable: true)
  int salePrice;
  @Column(nullable: true)
  int showIndex;
  @Column(nullable: true)
  int specType;
  @Column(nullable: true)
  int transferPrice;
  @Column(nullable: true)
  int transferFeeType;

}

// class _GoodsDetail {
//   @primaryKey
//   int id;
//
//   int categoryId;
//   // Map commentInfo;
//   // List commentNum;
//   // List commentRate;
//   // List commentScore;
//   // List detailImgList;
//   String firstRate;
//   String focusImg;
//   String goodsCode;
//   String goodsDesc;
//   // Map goodsDetail;
//   String goodsHeight;
//   // List goodsImg;
//   String goodsLong;
//   String goodsName;
//   // List goodsSaleList;
//   String goodsStock;
//   String goodsWeight;
//   String goodsWidth;
//   // List imgList;
//   String lastRate;
//   String sendCity;
//   // Map shopInfo;
//   // List shortVideoUrl;
//   String transferFeeTip;
//   // List transferId;
//   int goodsId;
//   int goodsType;
//   int morePayStatus;
//   int parentCategoryId;
//   int platformOnline;
//   int purchaseNum;
//   int saleNum;
//   int salePrice;
//   int showIndex;
//   int specType;
//   int transferPrice;
//   int transferFeeType;
//
// }


