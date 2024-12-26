import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunitiesRecord extends FirestoreRecord {
  CommunitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "community_name" field.
  String? _communityName;
  String get communityName => _communityName ?? '';
  bool hasCommunityName() => _communityName != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "community_image" field.
  String? _communityImage;
  String get communityImage => _communityImage ?? '';
  bool hasCommunityImage() => _communityImage != null;

  // "community_category" field.
  String? _communityCategory;
  String get communityCategory => _communityCategory ?? '';
  bool hasCommunityCategory() => _communityCategory != null;

  // "about_community" field.
  String? _aboutCommunity;
  String get aboutCommunity => _aboutCommunity ?? '';
  bool hasAboutCommunity() => _aboutCommunity != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "joinedUsersRef" field.
  List<DocumentReference>? _joinedUsersRef;
  List<DocumentReference> get joinedUsersRef => _joinedUsersRef ?? const [];
  bool hasJoinedUsersRef() => _joinedUsersRef != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  void _initializeFields() {
    _communityName = snapshotData['community_name'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _communityImage = snapshotData['community_image'] as String?;
    _communityCategory = snapshotData['community_category'] as String?;
    _aboutCommunity = snapshotData['about_community'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _joinedUsersRef = getDataList(snapshotData['joinedUsersRef']);
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('communities');

  static Stream<CommunitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunitiesRecord.fromSnapshot(s));

  static Future<CommunitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunitiesRecord.fromSnapshot(s));

  static CommunitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunitiesRecordData({
  String? communityName,
  DocumentReference? createdUserRef,
  String? communityImage,
  String? communityCategory,
  String? aboutCommunity,
  DateTime? createdTime,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'community_name': communityName,
      'createdUserRef': createdUserRef,
      'community_image': communityImage,
      'community_category': communityCategory,
      'about_community': aboutCommunity,
      'created_time': createdTime,
      'chatRef': chatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunitiesRecordDocumentEquality implements Equality<CommunitiesRecord> {
  const CommunitiesRecordDocumentEquality();

  @override
  bool equals(CommunitiesRecord? e1, CommunitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.communityName == e2?.communityName &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.communityImage == e2?.communityImage &&
        e1?.communityCategory == e2?.communityCategory &&
        e1?.aboutCommunity == e2?.aboutCommunity &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.joinedUsersRef, e2?.joinedUsersRef) &&
        e1?.chatRef == e2?.chatRef;
  }

  @override
  int hash(CommunitiesRecord? e) => const ListEquality().hash([
        e?.communityName,
        e?.createdUserRef,
        e?.communityImage,
        e?.communityCategory,
        e?.aboutCommunity,
        e?.createdTime,
        e?.joinedUsersRef,
        e?.chatRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunitiesRecord;
}
