import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

// terminal code : flutter pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class Store implements _$Store {
  const Store._();
  const factory Store({
    String? id,
    required bool isSuperMarket,
    required String name,
    required int? postCode,
    required String address,
    required String? phoneNumber,
    required String genre,
    double? latitude,
    double? longitude,
    String? imagePath,
    @Default(false) bool reserve,
    List<String>? regularHoliday,
    @Default(false) bool creditCardUse,
    List<String>? creditCardDetail,
    @Default(false) bool electricMoneyUse,
    List<String>? electricMoneyDetail,
    int? seats,
    // int? personalSeats,
    @Default(false) bool smoking,
    int? parking,
    String? homePageUrl,
    String? twitterUrl,
    String? instagramUrl,
    String? facebookUrl,
    DateTime? createdAt,
  }) = _Store;

  factory Store.empty() => const Store(
      isSuperMarket: false,
      name: "",
      postCode: 0,
      address: "",
      phoneNumber: '',
      genre: '');

  factory Store.fromJson(json) => _$StoreFromJson(json);

  factory Store.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Store.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
