import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String generateFirstThreeLetter(DateTime date) {
  // generate First Three Letter Of any Month From DateTime Value In Upper Case
  // extract the month from the DateTime value
  String month = DateFormat.MMMM().format(date);

  // generate first three letter in upper case
  if (month.length < 3) {
    return month.toUpperCase();
  } else {
    return month.substring(0, 3).toUpperCase();
  }
}

String? generateOnlyDayFromDateTimeValue(DateTime? dateTime) {
  // generate Only Day From DateTime Value
  // generate Only Day From Date Time Value
  if (dateTime != null) {
    // extract only the day part from the DateTime value
    String day = DateFormat('dd').format(dateTime);
    return day;
  } else {
    return null;
  }
}

List<String> generateListOfUserNames(
  String authUserName,
  String otherUserName,
) {
  return [authUserName, otherUserName];
}

List<DocumentReference> generateListOfUsers(
  DocumentReference authUser,
  DocumentReference otherUser,
) {
  return [authUser, otherUser];
}

DocumentReference generateOtherUserRef(
  DocumentReference authUserRef,
  List<DocumentReference> listOfUserRef,
) {
  return authUserRef == listOfUserRef.first
      ? listOfUserRef.last
      : listOfUserRef.first;
}

String getOtherUserName(
  String authUserRef,
  List<String> listOfNames,
) {
  return authUserRef == listOfNames.first
      ? listOfNames.last
      : listOfNames.first;
}
