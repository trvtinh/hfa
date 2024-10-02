import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  FirebaseApi._();
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final db = FirebaseFirestore.instance;

  static Future<QuerySnapshot<Map<String, dynamic>>> getQuerySnapshot(
      String collection, String field, String value) async {
    final querySnapshot =
        await db.collection(collection).where(field, isEqualTo: value).get();
    return querySnapshot;
  }

  // Truy vấn và lấy `docID` của tài liệu dựa trên giá trị trường cụ thể
  static Future<String?> getDocumentId(
      String collection, String field, String value) async {
    try {
      final querySnapshot =
          await db.collection(collection).where(field, isEqualTo: value).get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id;
      } else {
        print('No document found with $field: $value');
        return null;
      }
    } catch (e) {
      print('Error retrieving document ID: $e');
      return null;
    }
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

  static Future addDocument(
      String collection, Map<String, dynamic> data) async {
    try {
      final docRef = await db.collection(collection).add(data);
      print('Document added successfully to $collection.');
      return docRef.id;
    } catch (e) {
      print('Error adding document: $e');
    }
  }

  static Future<String?> uploadImage(
      String imagePath, String folderPath) async {
    try {
      File file = File(imagePath);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = _storage.ref().child('$folderPath/$fileName');
      UploadTask uploadTask = storageRef.putFile(file);
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
