import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessRecord extends FirestoreRecord {
  BusinessRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "business_image" field.
  String? _businessImage;
  String get businessImage => _businessImage ?? '';
  bool hasBusinessImage() => _businessImage != null;

  // "business_category" field.
  String? _businessCategory;
  String get businessCategory => _businessCategory ?? '';
  bool hasBusinessCategory() => _businessCategory != null;

  // "business_email" field.
  String? _businessEmail;
  String get businessEmail => _businessEmail ?? '';
  bool hasBusinessEmail() => _businessEmail != null;

  // "business_address" field.
  String? _businessAddress;
  String get businessAddress => _businessAddress ?? '';
  bool hasBusinessAddress() => _businessAddress != null;

  // "business_map" field.
  String? _businessMap;
  String get businessMap => _businessMap ?? '';
  bool hasBusinessMap() => _businessMap != null;

  // "business_whatsapp" field.
  String? _businessWhatsapp;
  String get businessWhatsapp => _businessWhatsapp ?? '';
  bool hasBusinessWhatsapp() => _businessWhatsapp != null;

  // "business_phone" field.
  String? _businessPhone;
  String get businessPhone => _businessPhone ?? '';
  bool hasBusinessPhone() => _businessPhone != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "business_about" field.
  String? _businessAbout;
  String get businessAbout => _businessAbout ?? '';
  bool hasBusinessAbout() => _businessAbout != null;

  void _initializeFields() {
    _businessName = snapshotData['business_name'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _businessImage = snapshotData['business_image'] as String?;
    _businessCategory = snapshotData['business_category'] as String?;
    _businessEmail = snapshotData['business_email'] as String?;
    _businessAddress = snapshotData['business_address'] as String?;
    _businessMap = snapshotData['business_map'] as String?;
    _businessWhatsapp = snapshotData['business_whatsapp'] as String?;
    _businessPhone = snapshotData['business_phone'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _businessAbout = snapshotData['business_about'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('business');

  static Stream<BusinessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessRecord.fromSnapshot(s));

  static Future<BusinessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessRecord.fromSnapshot(s));

  static BusinessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessRecordData({
  String? businessName,
  DocumentReference? createdUserRef,
  String? businessImage,
  String? businessCategory,
  String? businessEmail,
  String? businessAddress,
  String? businessMap,
  String? businessWhatsapp,
  String? businessPhone,
  DateTime? createdTime,
  String? businessAbout,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business_name': businessName,
      'createdUserRef': createdUserRef,
      'business_image': businessImage,
      'business_category': businessCategory,
      'business_email': businessEmail,
      'business_address': businessAddress,
      'business_map': businessMap,
      'business_whatsapp': businessWhatsapp,
      'business_phone': businessPhone,
      'created_time': createdTime,
      'business_about': businessAbout,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessRecordDocumentEquality implements Equality<BusinessRecord> {
  const BusinessRecordDocumentEquality();

  @override
  bool equals(BusinessRecord? e1, BusinessRecord? e2) {
    return e1?.businessName == e2?.businessName &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.businessImage == e2?.businessImage &&
        e1?.businessCategory == e2?.businessCategory &&
        e1?.businessEmail == e2?.businessEmail &&
        e1?.businessAddress == e2?.businessAddress &&
        e1?.businessMap == e2?.businessMap &&
        e1?.businessWhatsapp == e2?.businessWhatsapp &&
        e1?.businessPhone == e2?.businessPhone &&
        e1?.createdTime == e2?.createdTime &&
        e1?.businessAbout == e2?.businessAbout;
  }

  @override
  int hash(BusinessRecord? e) => const ListEquality().hash([
        e?.businessName,
        e?.createdUserRef,
        e?.businessImage,
        e?.businessCategory,
        e?.businessEmail,
        e?.businessAddress,
        e?.businessMap,
        e?.businessWhatsapp,
        e?.businessPhone,
        e?.createdTime,
        e?.businessAbout
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessRecord;
}
