import 'dart:convert';
/// id : 1
/// category_name : "Fruits/vegetables"
/// commodity_name : "Carrot"
/// validated : null
/// sex : null
/// harvest_date : "Monday 12th December 2022"
/// county_name : "Nairobi"
/// constituency_name : "Starehe"
/// market_name : "Markiti"
/// whole_sale_price : "300.00"
/// retail_price : null
/// sold : 0
/// volume : "200 kgs"
/// poster : null
/// farmer_id : 1
/// commodity_id : 34
/// verified : 1
/// organic : 1
/// created_at : "2022-07-10T20:36:08.000000Z"
/// updated_at : "2022-07-10T20:36:08.000000Z"
/// deleted_at : null

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      int? id, 
      String? categoryName, 
      String? commodityName, 
      dynamic validated, 
      dynamic sex, 
      String? harvestDate, 
      String? countyName, 
      String? constituencyName, 
      String? marketName, 
      String? wholeSalePrice, 
      dynamic retailPrice, 
      int? sold, 
      String? volume, 
      dynamic poster, 
      int? farmerId, 
      int? commodityId, 
      int? verified, 
      int? organic, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _categoryName = categoryName;
    _commodityName = commodityName;
    _validated = validated;
    _sex = sex;
    _harvestDate = harvestDate;
    _countyName = countyName;
    _constituencyName = constituencyName;
    _marketName = marketName;
    _wholeSalePrice = wholeSalePrice;
    _retailPrice = retailPrice;
    _sold = sold;
    _volume = volume;
    _poster = poster;
    _farmerId = farmerId;
    _commodityId = commodityId;
    _verified = verified;
    _organic = organic;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _commodityName = json['commodity_name'];
    _validated = json['validated'];
    _sex = json['sex'];
    _harvestDate = json['harvest_date'];
    _countyName = json['county_name'];
    _constituencyName = json['constituency_name'];
    _marketName = json['market_name'];
    _wholeSalePrice = json['whole_sale_price'];
    _retailPrice = json['retail_price'];
    _sold = json['sold'];
    _volume = json['volume'];
    _poster = json['poster'];
    _farmerId = json['farmer_id'];
    _commodityId = json['commodity_id'];
    _verified = json['verified'];
    _organic = json['organic'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  int? _id;
  String? _categoryName;
  String? _commodityName;
  dynamic _validated;
  dynamic _sex;
  String? _harvestDate;
  String? _countyName;
  String? _constituencyName;
  String? _marketName;
  String? _wholeSalePrice;
  dynamic _retailPrice;
  int? _sold;
  String? _volume;
  dynamic _poster;
  int? _farmerId;
  int? _commodityId;
  int? _verified;
  int? _organic;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
Products copyWith({  int? id,
  String? categoryName,
  String? commodityName,
  dynamic validated,
  dynamic sex,
  String? harvestDate,
  String? countyName,
  String? constituencyName,
  String? marketName,
  String? wholeSalePrice,
  dynamic retailPrice,
  int? sold,
  String? volume,
  dynamic poster,
  int? farmerId,
  int? commodityId,
  int? verified,
  int? organic,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Products(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  commodityName: commodityName ?? _commodityName,
  validated: validated ?? _validated,
  sex: sex ?? _sex,
  harvestDate: harvestDate ?? _harvestDate,
  countyName: countyName ?? _countyName,
  constituencyName: constituencyName ?? _constituencyName,
  marketName: marketName ?? _marketName,
  wholeSalePrice: wholeSalePrice ?? _wholeSalePrice,
  retailPrice: retailPrice ?? _retailPrice,
  sold: sold ?? _sold,
  volume: volume ?? _volume,
  poster: poster ?? _poster,
  farmerId: farmerId ?? _farmerId,
  commodityId: commodityId ?? _commodityId,
  verified: verified ?? _verified,
  organic: organic ?? _organic,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  int? get id => _id;
  String? get categoryName => _categoryName;
  String? get commodityName => _commodityName;
  dynamic get validated => _validated;
  dynamic get sex => _sex;
  String? get harvestDate => _harvestDate;
  String? get countyName => _countyName;
  String? get constituencyName => _constituencyName;
  String? get marketName => _marketName;
  String? get wholeSalePrice => _wholeSalePrice;
  dynamic get retailPrice => _retailPrice;
  int? get sold => _sold;
  String? get volume => _volume;
  dynamic get poster => _poster;
  int? get farmerId => _farmerId;
  int? get commodityId => _commodityId;
  int? get verified => _verified;
  int? get organic => _organic;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['commodity_name'] = _commodityName;
    map['validated'] = _validated;
    map['sex'] = _sex;
    map['harvest_date'] = _harvestDate;
    map['county_name'] = _countyName;
    map['constituency_name'] = _constituencyName;
    map['market_name'] = _marketName;
    map['whole_sale_price'] = _wholeSalePrice;
    map['retail_price'] = _retailPrice;
    map['sold'] = _sold;
    map['volume'] = _volume;
    map['poster'] = _poster;
    map['farmer_id'] = _farmerId;
    map['commodity_id'] = _commodityId;
    map['verified'] = _verified;
    map['organic'] = _organic;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}