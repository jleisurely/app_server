import 'package:my_app/heroes.dart';


class Goods extends ManagedObject<_Goods> implements _Goods {}

class _Goods {
  @primaryKey
  int id;

  String address,
  beginTime,
  beginTimeShow,
  brandIds,
  brandList,
  brandNames,
  cityId,
  cityName,
  cityWeight,
  contactPerson,
  createUser,
  createUserId,
  detailHtml,
  distance,
  endTime,
  headImg,
  isApply,
  isOnline,
  isSign,
  latitude,
  listorder,
  locSearchWord,
  locationTag,
  longitude,
  mapImg,
  meetingNote,
  meetingStatus,
  mobile,
  phone,
  shareImgUrl,
  summary,
  title;
}


