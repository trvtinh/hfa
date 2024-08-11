import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  FirebaseApi._();
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final db = FirebaseFirestore.instance;
  // static Future<void> initNotifications() async {
  //   final firebaseMessaging = FirebaseMessaging.instance;
  //   await firebaseMessaging.requestPermission();
  //   final fCMToken = await firebaseMessaging.getToken();
  //   print('FCM Token: $fCMToken');
  // }

  static Future<QuerySnapshot<Map<String, dynamic>>> getQuerySnapshot(
      String collection, String field, String value) async {
    final querySnapshot =
        await db.collection(collection).where(field, isEqualTo: value).get();
    return querySnapshot;
  }

  static Future<void> deleteDocument(
      String collection, String documentId) async {
    try {
      final docRef = db.collection(collection).doc(documentId);
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
      final docRef = db.collection(collection).doc(docId);

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
      final docRef = db.collection(collection).doc(docId);

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

  static Future<void> addDocument(
      String collection, Map<String, dynamic> data) async {
    try {
      await db.collection(collection).add(data);
      print('Document added successfully to $collection.');
    } catch (e) {
      print('Error adding document: $e');
    }
  }

  static Future<String?> uploadFile(File file, String folderPath) async {
    try {
      // Tạo tên tệp duy nhất dựa trên thời gian hiện tại
      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}';

      // Tạo tham chiếu đến vị trí lưu trữ trong Firebase Storage
      Reference storageRef = _storage.ref().child('$folderPath/$fileName');

      // Tải lên tệp
      UploadTask uploadTask = storageRef.putFile(file);

      // Theo dõi trạng thái tải lên
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      print('File uploaded successfully: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  static Future<String?> uploadImage(File imageFile) async {
    try {
      // Lấy tên tệp (có thể tạo tên duy nhất)
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Tạo tham chiếu đến vị trí lưu trữ trong Firebase Storage
      Reference storageRef = _storage.ref().child('images/$fileName');

      // Tải lên tệp
      UploadTask uploadTask = storageRef.putFile(imageFile);

      // Theo dõi trạng thái tải lên
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      print('Image uploaded successfully: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
