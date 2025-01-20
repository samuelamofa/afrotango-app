import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "postImage" field.
  String? _postImage;
  String get postImage => _postImage ?? '';
  bool hasPostImage() => _postImage != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "usersLikes" field.
  int? _usersLikes;
  int get usersLikes => _usersLikes ?? 0;
  bool hasUsersLikes() => _usersLikes != null;

  // "usersShares" field.
  int? _usersShares;
  int get usersShares => _usersShares ?? 0;
  bool hasUsersShares() => _usersShares != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "postUserName" field.
  String? _postUserName;
  String get postUserName => _postUserName ?? '';
  bool hasPostUserName() => _postUserName != null;

  // "postUserImage" field.
  String? _postUserImage;
  String get postUserImage => _postUserImage ?? '';
  bool hasPostUserImage() => _postUserImage != null;

  void _initializeFields() {
    _postImage = snapshotData['postImage'] as String?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _usersLikes = castToType<int>(snapshotData['usersLikes']);
    _usersShares = castToType<int>(snapshotData['usersShares']);
    _postText = snapshotData['postText'] as String?;
    _postUserName = snapshotData['postUserName'] as String?;
    _postUserImage = snapshotData['postUserImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postImage,
  DocumentReference? postUser,
  int? usersLikes,
  int? usersShares,
  String? postText,
  String? postUserName,
  String? postUserImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postImage': postImage,
      'postUser': postUser,
      'usersLikes': usersLikes,
      'usersShares': usersShares,
      'postText': postText,
      'postUserName': postUserName,
      'postUserImage': postUserImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    return e1?.postImage == e2?.postImage &&
        e1?.postUser == e2?.postUser &&
        e1?.usersLikes == e2?.usersLikes &&
        e1?.usersShares == e2?.usersShares &&
        e1?.postText == e2?.postText &&
        e1?.postUserName == e2?.postUserName &&
        e1?.postUserImage == e2?.postUserImage;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postImage,
        e?.postUser,
        e?.usersLikes,
        e?.usersShares,
        e?.postText,
        e?.postUserName,
        e?.postUserImage
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
