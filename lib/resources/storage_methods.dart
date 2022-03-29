import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods
{
  final FirebaseStorage _storgae = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage (String childName, Uint8List file, bool isPost)
  async
  {
   Reference ref = _storgae.ref().child(childName).child(_auth.currentUser!.uid);

   UploadTask uploadTask = ref.putData(file);

   TaskSnapshot snap = await uploadTask;
   String downloadUrl = await snap.ref.getDownloadURL();
   return downloadUrl;
  }
}