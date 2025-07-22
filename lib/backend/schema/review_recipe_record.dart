import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewRecipeRecord extends FirestoreRecord {
  ReviewRecipeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "recipe" field.
  DocumentReference? _recipe;
  DocumentReference? get recipe => _recipe;
  bool hasRecipe() => _recipe != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _recipe = snapshotData['recipe'] as DocumentReference?;
    _rating = castToType<int>(snapshotData['rating']);
    _comment = snapshotData['comment'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('review_recipe');

  static Stream<ReviewRecipeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewRecipeRecord.fromSnapshot(s));

  static Future<ReviewRecipeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewRecipeRecord.fromSnapshot(s));

  static ReviewRecipeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewRecipeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewRecipeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewRecipeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewRecipeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewRecipeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewRecipeRecordData({
  DocumentReference? recipe,
  int? rating,
  String? comment,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recipe': recipe,
      'rating': rating,
      'comment': comment,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewRecipeRecordDocumentEquality
    implements Equality<ReviewRecipeRecord> {
  const ReviewRecipeRecordDocumentEquality();

  @override
  bool equals(ReviewRecipeRecord? e1, ReviewRecipeRecord? e2) {
    return e1?.recipe == e2?.recipe &&
        e1?.rating == e2?.rating &&
        e1?.comment == e2?.comment &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ReviewRecipeRecord? e) =>
      const ListEquality().hash([e?.recipe, e?.rating, e?.comment, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ReviewRecipeRecord;
}
