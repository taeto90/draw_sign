import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: White_Board()
    );
  }
}
class White_Board extends StatefulWidget {
  const White_Board({Key? key}) : super(key: key);

  @override
  State<White_Board> createState() => _White_BoardState();
}

class _White_BoardState extends State<White_Board> {
  WhiteBoardController whiteBoardController = WhiteBoardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            whiteBoardController.convertToImage();
          }, icon: Icon(Icons.image))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(child: WhiteBoard(
              controller: whiteBoardController,
              onConvertImage: (Uint8List imageList) async{
                await FileSaver.instance.saveAs('image/result_image',imageList,'png',MimeType.PNG);
              },
            ))
          ],
        ),
      ),

    );
  }
}