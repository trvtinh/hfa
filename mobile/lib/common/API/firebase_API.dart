import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  FirebaseApi._();

  static Future<void> initNotifications() async {
    final firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    final fCMToken = await firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getQuerySnapshot(
      String collection, String field, String value) async {
    final db = FirebaseFirestore.instance;
    final querySnapshot =
        await db.collection(collection).where(field, isEqualTo: value).get();
    return querySnapshot;
  }

  static Future<void> deleteDocument(
      String collection, String documentId) async {
    try {
      final docRef =
          FirebaseFirestore.instance.collection(collection).doc(documentId);
      await docRef.delete();
      print('Document $documentId deleted successfully from $collection.');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  static Future<bool> addValueToArrayField(
      String collection, String id, String fieldName, String valueToAdd) async {
    try {
      final querySnapshot = await getQuerySnapshot(collection, 'id', id);
      if (querySnapshot.docs.isEmpty) {
        print('No document found with id: $id');
        return false;
      }

      final docId = querySnapshot.docs.first.id;
      final docRef =
          FirebaseFirestore.instance.collection(collection).doc(docId);

      await docRef.update({
        fieldName: FieldValue.arrayUnion([valueToAdd]),
      });

      print('Value added to array field $fieldName in document $docId.');
      return true;
    } catch (e) {
      print('Error adding value to array field: $e');
      return false;
    }
  }

  static Future<bool> removeValueFromArrayField(String collection, String id,
      String fieldName, String valueToRemove) async {
    try {
      final querySnapshot = await getQuerySnapshot(collection, 'id', id);
      if (querySnapshot.docs.isEmpty) {
        print('No document found with id: $id');
        return false;
      }

      final docId = querySnapshot.docs.first.id;
      final docRef =
          FirebaseFirestore.instance.collection(collection).doc(docId);

      await docRef.update({
        fieldName: FieldValue.arrayRemove([valueToRemove]),
      });

      print('Value removed from array field $fieldName in document $docId.');
      return true;
    } catch (e) {
      print('Error removing value from array field: $e');
      return false;
    }
  }
}
