
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  PickedFile? imageFile;
  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.platform.pickImage (source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: conexionInternet(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
        if(snapshot.hasData){
          if(true){
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xbabad6fc),
                toolbarHeight: 90,
                leading: IconButton(
                 icon: Icon(
                    Icons.home,
                    size: 70,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    
                  },
                ),
                actions: <Widget>[
                  Column(
                    children: [
                      Text(
                        'MyBF', 
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.black
                        ),
                      ),
                      Image.asset('assets/logo.png',height: 50,)
                    ],
                  )
                  

                ],
              ),
              body: Container(
                child: Center(
                  child: Text(
                    'Publicaciones',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  //conexionError(context);
                  //loadImageError(context); 
                  _openCamera(context);
                },
                tooltip: 'Nueva Publicación',
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 30,
                ),
                backgroundColor: Colors.black,
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat   
            );
          }else{
            return Scaffold(
              appBar: AppBar(title: Text('Error'),),
              body: Container(
                
              ),
              
            );
          }
          
            
        
        }else{
          return Scaffold(
            appBar: AppBar(title: Text('Error'),),
            body: Container(),
          );
        }
      }
    );  
  }
}

void loadImageError(BuildContext context){
  DialogBackground(
    dialog:  AlertDialog(
      backgroundColor: Colors.red,
      title: Text("ERROR!!",style: TextStyle(color: Colors.white,fontSize: 30),),
      content: Text(
        "¡No se puede cargar la imagen!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20  
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          child: Container(
            padding: EdgeInsets.all(15),
            width: 120,
            child: Text("Okay",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.red.shade900,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),            
          ),
          onPressed: () => Navigator.pop(context)
        ),
      ],
    ),
  ).show(context);
}


void conexionError(BuildContext context){
  DialogBackground(
    dialog:  AlertDialog(
      title: Text("ERROR!!",style: TextStyle(color: Colors.red,fontSize: 30),),
      content: Text(
        "¡Sin Conexion a Internet!",
        style: TextStyle(
          color: Colors.red,
          fontSize: 20  
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Okay",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16
            ),
          ),        
          onPressed: () => exit(0)
        ),
      ],
    ),
  ).show(context);
}
Future<bool> conexionInternet(){
  var ConextionResult = Connectivity().checkConnectivity();
  if(ConextionResult == ConnectivityResult.wifi){
    return Future.value(true);
  }else{
    return Future.value(false);
  }
} 
