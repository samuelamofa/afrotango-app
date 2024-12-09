import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "review_text" field.
  String? _reviewText;
  String get reviewText => _reviewText ?? '';
  bool hasReviewText() => _reviewText != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "ratings_count_value" field.
  double? _ratingsCountValue;
  double get ratingsCountValue => _ratingsCountValue ?? 0.0;
  bool hasRatingsCountValue() => _ratingsCountValue != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reviewText = snapshotData['review_text'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _ratingsCountValue =
        castToType<double>(snapshotData['ratings_count_value']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reviews')
          : FirebaseFirestore.instance.collectionGroup('reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reviews').doc(id);

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  String? reviewText,
  DocumentReference? createdUserRef,
  double? ratingsCountValue,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'review_text': reviewText,
      'createdUserRef': createdUserRef,
      'ratings_count_value': ratingsCountValue,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.reviewText == e2?.reviewText &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.ratingsCountValue == e2?.ratingsCountValue &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash(
      [e?.reviewText, e?.createdUserRef, e?.ratingsCountValue, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
