import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessReviewRecord extends FirestoreRecord {
  BusinessReviewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "businessID" field.
  DocumentReference? _businessID;
  DocumentReference? get businessID => _businessID;
  bool hasBusinessID() => _businessID != null;

  // "review_text" field.
  String? _reviewText;
  String get reviewText => _reviewText ?? '';
  bool hasReviewText() => _reviewText != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _businessID = snapshotData['businessID'] as DocumentReference?;
    _reviewText = snapshotData['review_text'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('businessReview');

  static Stream<BusinessReviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessReviewRecord.fromSnapshot(s));

  static Future<BusinessReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessReviewRecord.fromSnapshot(s));

  static BusinessReviewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessReviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessReviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessReviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessReviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessReviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessReviewRecordData({
  DocumentReference? userID,
  DocumentReference? businessID,
  String? reviewText,
  DateTime? date,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'businessID': businessID,
      'review_text': reviewText,
      'date': date,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessReviewRecordDocumentEquality
    implements Equality<BusinessReviewRecord> {
  const BusinessReviewRecordDocumentEquality();

  @override
  bool equals(BusinessReviewRecord? e1, BusinessReviewRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.businessID == e2?.businessID &&
        e1?.reviewText == e2?.reviewText &&
        e1?.date == e2?.date &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(BusinessReviewRecord? e) => const ListEquality()
      .hash([e?.userID, e?.businessID, e?.reviewText, e?.date, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is BusinessReviewRecord;
}
