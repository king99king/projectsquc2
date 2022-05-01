

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';


class Storage{
  final firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;
//uploade file to fire base
  Future<void> uploadFile(
      String filePath,
      String fileName,
      ) async{
     File file=File(filePath);
     try{
       await storage.ref('SQUTest/$fileName').putFile(file);
     }on firebase_core.FirebaseException catch(e){
       print(e);
     }
    
  }
  //=======================================================================
  Future<firebase_storage.ListResult> listFiles() async{
    firebase_storage.ListResult results=await storage.ref('SQUTest/').listAll();

    results.items.forEach((firebase_storage.Reference ref){
    print('found file :$ref');
    });
    return results;
  }
  Future<String> downloadURL(String imagName) async{
    String downloadURL = await storage.ref('SQUTest/$imagName').getDownloadURL();
    return downloadURL;

  }
}


