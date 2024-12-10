import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdsRecord extends FirestoreRecord {
  AdsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ads_name" field.
  String? _adsName;
  String get adsName => _adsName ?? '';
  bool hasAdsName() => _adsName != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "ad_category" field.
  String? _adCategory;
  String get adCategory => _adCategory ?? '';
  bool hasAdCategory() => _adCategory != null;

  // "ad_description" field.
  String? _adDescription;
  String get adDescription => _adDescription ?? '';
  bool hasAdDescription() => _adDescription != null;

  // "ad_pricing" field.
  int? _adPricing;
  int get adPricing => _adPricing ?? 0;
  bool hasAdPricing() => _adPricing != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "ad_image" field.
  String? _adImage;
  String get adImage => _adImage ?? '';
  bool hasAdImage() => _adImage != null;

  void _initializeFields() {
    _adsName = snapshotData['ads_name'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _adCategory = snapshotData['ad_category'] as String?;
    _adDescription = snapshotData['ad_description'] as String?;
    _adPricing = castToType<int>(snapshotData['ad_pricing']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _adImage = snapshotData['ad_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ads');

  static Stream<AdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdsRecord.fromSnapshot(s));

  static Future<AdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdsRecord.fromSnapshot(s));

  static AdsRecord fromSnapshot(DocumentSnapshot snapshot) => AdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdsRecordData({
  String? adsName,
  DocumentReference? createdUserRef,
  String? adCategory,
  String? adDescription,
  int? adPricing,
  DateTime? createdTime,
  String? adImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ads_name': adsName,
      'createdUserRef': createdUserRef,
      'ad_category': adCategory,
      'ad_description': adDescription,
      'ad_pricing': adPricing,
      'created_time': createdTime,
      'ad_image': adImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdsRecordDocumentEquality implements Equality<AdsRecord> {
  const AdsRecordDocumentEquality();

  @override
  bool equals(AdsRecord? e1, AdsRecord? e2) {
    return e1?.adsName == e2?.adsName &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.adCategory == e2?.adCategory &&
        e1?.adDescription == e2?.adDescription &&
        e1?.adPricing == e2?.adPricing &&
        e1?.createdTime == e2?.createdTime &&
        e1?.adImage == e2?.adImage;
  }

  @override
  int hash(AdsRecord? e) => const ListEquality().hash([
        e?.adsName,
        e?.createdUserRef,
        e?.adCategory,
        e?.adDescription,
        e?.adPricing,
        e?.createdTime,
        e?.adImage
      ]);

  @override
  bool isValidKey(Object? o) => o is AdsRecord;
}
