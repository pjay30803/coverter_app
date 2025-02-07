import 'package:converter_app/heplers/providers/platform_provider.dart';
import 'package:converter_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>PlatformProvider()),
  ],
  builder: (contect,_){
    return PlatformApp();
  },)
  );
}

class PlatformApp extends StatelessWidget {
  const PlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlatformProvider>(context).isIOS==false)
        ? MaterialApp(
      debugShowCheckedModeBanner: false,
          home: HomePage(),
        )


      :
    CupertinoApp(
      debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
  }
}
