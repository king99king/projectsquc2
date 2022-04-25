
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:projectsquc/Storage_Fire_base.dart';
class FireBase extends StatefulWidget {
  const FireBase({Key? key}) : super(key: key);

  @override
  _FireBaseState createState() => _FireBaseState();
}

class _FireBaseState extends State<FireBase> {
  @override
  Widget build(BuildContext context) {
    final Storage storage =Storage();

    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [


         Container(
            child: ElevatedButton(
            onPressed: () async{
              final result =await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ['png','jpg']
              );
              if(result==null){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No file Selected"),)
                );
                return null;

              }
              //store the path of the file from fire_base
              final path=result.files.single.path;
              // file name
              final fileName= result.files.single.name;
              // print(path);
              // print(fileName);
              storage.uploadFile(path!, fileName).then((value) => print('Done'));


            },

              child: Text("upload"),

            ),

          ),
            FutureBuilder(
              future: storage.listFiles(),
              builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot){
                if(snapshot.connectionState ==ConnectionState.done && snapshot.hasData){
                  return Container(
                    height: 100,
                    child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                        shrinkWrap: true,

                        itemCount: snapshot.data!.items.length,
                        itemBuilder: (BuildContext context, int index){
                         return ElevatedButton(
                            onPressed: (){

                            },
                            child: Text(snapshot.data!.items[index].name),

                          );
                        }),
                  );
                }
    if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData ) {
      return  CircularProgressIndicator();
    }
    return Container();
    },

            ),
    //=================================


            FutureBuilder(
              future: storage.downloadURL('appLogo.png'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                if(snapshot.connectionState ==ConnectionState.done && snapshot.hasData){
                  return Container(
                    height: 100,
                    child:Image.network(snapshot.data!,
                    fit: BoxFit.cover,)
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData ) {
                  return  CircularProgressIndicator();
                }
                return Container();
              },

            ),
          ],
        ),

      ),
    );
  }
}

