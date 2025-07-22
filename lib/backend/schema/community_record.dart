import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityRecord extends FirestoreRecord {
  CommunityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "posts" field.
  List<DocumentReference>? _posts;
  List<DocumentReference> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  // "events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "communityfiles" field.
  List<String>? _communityfiles;
  List<String> get communityfiles => _communityfiles ?? const [];
  bool hasCommunityfiles() => _communityfiles != null;

  // "catigories" field.
  List<DocumentReference>? _catigories;
  List<DocumentReference> get catigories => _catigories ?? const [];
  bool hasCatigories() => _catigories != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  void _initializeFields() {
    _displayName = snapshotData['displayName'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _members = getDataList(snapshotData['members']);
    _posts = getDataList(snapshotData['posts']);
    _events = getDataList(snapshotData['events']);
    _communityfiles = getDataList(snapshotData['communityfiles']);
    _catigories = getDataList(snapshotData['catigories']);
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('community');

  static Stream<CommunityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityRecord.fromSnapshot(s));

  static Future<CommunityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityRecord.fromSnapshot(s));

  static CommunityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityRecordData({
  String? displayName,
  String? description,
  String? image,
  DocumentReference? createdUserRef,
  DateTime? createdTime,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'displayName': displayName,
      'description': description,
      'image': image,
      'createdUserRef': createdUserRef,
      'createdTime': createdTime,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityRecordDocumentEquality implements Equality<CommunityRecord> {
  const CommunityRecordDocumentEquality();

  @override
  bool equals(CommunityRecord? e1, CommunityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.posts, e2?.posts) &&
        listEquality.equals(e1?.events, e2?.events) &&
        listEquality.equals(e1?.communityfiles, e2?.communityfiles) &&
        listEquality.equals(e1?.catigories, e2?.catigories) &&
        e1?.country == e2?.country;
  }

  @override
  int hash(CommunityRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.description,
        e?.image,
        e?.createdUserRef,
        e?.createdTime,
        e?.members,
        e?.posts,
        e?.events,
        e?.communityfiles,
        e?.catigories,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunityRecord;
}
