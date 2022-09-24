// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      id: json['id'] as String?,
      isSuperMarket: json['isSuperMarket'] as bool,
      name: json['name'] as String,
      postCode: json['postCode'] as String?,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      genre: json['genre'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      imagePath: json['imagePath'] as String?,
      reserve: json['reserve'] as bool? ?? false,
      regularHoliday: (json['regularHoliday'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      creditCardUse: json['creditCardUse'] as bool? ?? false,
      creditCardDetail: (json['creditCardDetail'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      electricMoneyUse: json['electricMoneyUse'] as bool? ?? false,
      electricMoneyDetail: (json['electricMoneyDetail'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      seats: json['seats'] as int?,
      personalSeats: json['personalSeats'] as int?,
      smoking: json['smoking'] as bool? ?? false,
      parking: json['parking'] as int?,
      homePageUrl: json['homePageUrl'] as String?,
      twitterUrl: json['twitterUrl'] as String?,
      instagramUrl: json['instagramUrl'] as String?,
      facebookUrl: json['facebookUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'isSuperMarket': instance.isSuperMarket,
      'name': instance.name,
      'postCode': instance.postCode,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'genre': instance.genre,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'imagePath': instance.imagePath,
      'reserve': instance.reserve,
      'regularHoliday': instance.regularHoliday,
      'creditCardUse': instance.creditCardUse,
      'creditCardDetail': instance.creditCardDetail,
      'electricMoneyUse': instance.electricMoneyUse,
      'electricMoneyDetail': instance.electricMoneyDetail,
      'seats': instance.seats,
      'personalSeats': instance.personalSeats,
      'smoking': instance.smoking,
      'parking': instance.parking,
      'homePageUrl': instance.homePageUrl,
      'twitterUrl': instance.twitterUrl,
      'instagramUrl': instance.instagramUrl,
      'facebookUrl': instance.facebookUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
