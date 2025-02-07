import 'dart:convert';
import 'dart:io';
import 'package:converter_app/heplers/providers/platform_provider.dart';
import 'package:converter_app/views/components/chat_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

  DateTime currentDateTime=DateTime.now();
  TimeOfDay currentTime=TimeOfDay.now();

  PageController pageController=PageController();

  int selectedNavBarIndex=0;

  //2 List for dynamic pageview
  List<String> fruits=[
    "Apple",
    "Mango",
    "Orange",
    "Banana"
  ];
  List<Color> colors=[
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.amber,
  ];

  double initialSliderval=10;
  String initialButtonval='first';

  @override
  Widget build(BuildContext context) {
    return(Provider.of<PlatformProvider>(context).isIOS==false)
      ? Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
    actions:[
      IconButton(onPressed: () {
      Provider.of<PlatformProvider>(context,listen: false).changePlatform();
      },
          icon: Icon(Icons.shuffle)) ,
    ]
      ),

      //Modal Bottom Sheet,Date Picker,Time Picker,Alert Dialog

      // body: Container(
      // alignment: Alignment.center,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       // CircularProgressIndicator(),
      //       // LinearProgressIndicator(),
      //       //
      //       // TextButton(onPressed: () {
      //       //
      //       // },
      //       //     child: Text("Button")
      //       // ),
      //       // OutlinedButton(
      //       //     onPressed: () {
      //       // showModalBottomSheet(
      //       //     context: context,
      //       //     builder: (context){
      //       //   return Container(
      //       //     height: 200,
      //       //     color: Colors.blue,
      //       //   );
      //       //     });
      //       // },
      //       //     child: Text("Open Modal Bottom Sheet")),
      //       // OutlinedButton(onPressed: () {
      //       // scaffoldKey.currentState!.showBottomSheet((context){
      //       //   return Container(
      //       //    height: 200,
      //       //    color: Colors.greenAccent,
      //       //   );
      //       // });
      //       // },
      //       //     child: Text("Button")
      //       // ),
      //       // ElevatedButton(onPressed: () {
      //       //
      //       // },
      //       //     child: Text("Button")
      //       // ),
      //       // IconButton(onPressed: () {
      //       //
      //       // } ,
      //       //     icon: Icon(Icons.add))
      //       Text("${currentDateTime.day}/${currentDateTime.month}/${currentDateTime.year}",
      //       style: TextStyle(fontSize: 50),),
      //       OutlinedButton(onPressed:() async{
      //         DateTime? pickedDate=await showDatePicker(
      //         context: context,
      //         firstDate: DateTime(1950),
      //           lastDate: DateTime(2050),
      //           initialDatePickerMode: DatePickerMode.day,
      //           initialEntryMode: DatePickerEntryMode.calendarOnly,
      //           helpText: "Choose Date",
      //           confirmText: "Done",
      //           cancelText: "Dismiss"
      //         );
      //         setState(() {
      //           if(pickedDate !=null){
      //             currentDateTime=pickedDate;
      //           }
      //         });
      //       }, child: Text("Date")),
      //       Divider(),
      //       (currentTime.hour>12)
      //       ?
      //       Text("${currentTime.hour-12}:${currentTime.minute} ${currentTime.period.name}",
      //       style: TextStyle(fontSize: 40),)
      //           :
      //       Text("${currentTime.hour}:${currentTime.minute} ${currentTime.period.name}",
      //       style: TextStyle(fontSize: 40),),
      //
      //       OutlinedButton(onPressed: ()async {
      //       TimeOfDay? pickedtime=await showTimePicker(
      //           context: context,
      //           initialTime: currentTime,
      //           initialEntryMode: TimePickerEntryMode.dialOnly,
      //         helpText: "Pick Time",
      //         cancelText: "Dismiss",
      //         confirmText: "Book"
      //       );
      //       setState(() {
      //         if(pickedtime!=null){
      //           currentTime=pickedtime;
      //         }
      //       });
      //       },
      //           child: Text("Select Time")),
      //       Divider(),
      //       OutlinedButton(onPressed: () {
      //         showDialog(context: context,
      //             builder: (context){
      //           return AlertDialog(
      //             title: Text("ALertDialog"),
      //             content: Text("data"),
      //             actions: [
      //               TextButton(
      //                   onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //                   child: Text("Cancel")),
      //               TextButton(
      //                   onPressed: () {
      //                     Navigator.of(context).pop();
      //
      //                   }, child: Text("Ok"))
      //             ],
      //           );
      //             });
      //       },
      //           child: Text("Dialog"))
      //     ],
      //   )
      // ),


      //PageView:- Static
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        onPageChanged: (val){
          setState(() {
            selectedNavBarIndex=val;

          });
        },
        children: [
          ChatComponent(),
          Container(child: Text("Chat"),color: Colors.redAccent,alignment: Alignment.center,),
          Container(child: Text("Setting"),color: Colors.blueAccent,alignment: Alignment.center,),


        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          // FloatingActionButton(onPressed: () {
          //   // pageController.jumpToPage(0);
          //   pageController.animateToPage(
          //       1,
          //       duration: Duration(seconds: 1),
          //       curve: Curves.easeInOut);
          // },
          // child: Icon(Icons.skip_previous),),
          // FloatingActionButton(onPressed: () {
          //   // pageController.jumpToPage(0);
          //   pageController.animateToPage(
          //       2,
          //       duration: Duration(seconds: 1),
          //       curve: Curves.linear);
          // },
          //   child: Icon(Icons.skip_next),),
        ],
      ),
      //PageView :- Dynamic
      // body: PageView.builder(
      //     itemCount: fruits.length,
      //     itemBuilder: (context,i){
      //       return Container(
      //         alignment: Alignment.center,
      //         child: Text("${i}"),
      //         color: colors[i],
      //       );
      //     }),
        
        //BottomNavigation Bar:-

      // bottomNavigationBar: BottomNavigationBar(
      //     items:[
      //   BottomNavigationBarItem(label:"Home",icon: Icon(Icons.home),),
      //       BottomNavigationBarItem(label:"Home",icon: Icon(Icons.chat),),
      //       BottomNavigationBarItem(label:"Home",icon: Icon(Icons.settings),),
      //
      //     ],
      
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedNavBarIndex,
          onDestinationSelected: (val){
          setState(() {
            selectedNavBarIndex=val;
            pageController.animateToPage(
                val,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          });
          },
          destinations:[
            NavigationDestination(icon: Icon(Icons.home),
                label: "Home"),
            NavigationDestination(icon: Icon(Icons.chat),
                label: "Chat"),
            NavigationDestination(icon: Icon(Icons.settings),
                label: "Settings")
          ] ),


      
     
    )
    
    :  CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home page"),
        leading: Icon(CupertinoIcons.home),
        trailing:IconButton(onPressed: () {
          Provider.of<PlatformProvider>(context,listen: false).changePlatform();
        },
            icon: Icon(CupertinoIcons.shuffle)) ,

      ),
      // child: Container(
      // alignment: Alignment.center,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     spacing: 20,
      //     children: [
      //       // CupertinoActivityIndicator(radius: 40,
      //       //   animating: true,
      //       // color: CupertinoColors.activeBlue,
      //       // ),
      //       // Divider(),
      //       // CupertinoButton(
      //       //     child: Text("Button"),
      //       //     onPressed: () {
      //       //
      //       //     },),
      //       //
      //       // CupertinoButton.filled(
      //       //   child: Text("Button"),
      //       //   onPressed: () {
      //       //   },),
      //
      //       // CupertinoButton.tinted(
      //       //   child: Text("Button"),
      //       //   onPressed: () {
      //       //     showCupertinoModalPopup(
      //       //         context: context,
      //       //         builder: (context){
      //       //           return CupertinoActionSheet(
      //       //             title: Text("Countries"),
      //       //             message: Text("Select any one country"),
      //       //             actions: [
      //       //               CupertinoActionSheetAction(
      //       //                   onPressed: () {
      //       //
      //       //                   },
      //       //                   child: Text("India")),
      //       //               CupertinoActionSheetAction(
      //       //                   onPressed: () {
      //       //
      //       //                   },
      //       //                   child: Text("USA")),
      //       //               CupertinoActionSheetAction(
      //       //                   onPressed: () {
      //       //
      //       //                   },
      //       //                   child: Text("CANADA")),
      //       //             ],
      //       //             cancelButton: CupertinoActionSheetAction(
      //       //                 onPressed: () {
      //       //               Navigator.of(context).pop();
      //       //             },
      //       //                 isDestructiveAction: true,
      //       //                 child: Text("Cancel")),
      //       //           );
      //       //         });
      //       //   },
      //       // color: CupertinoColors.activeGreen,),
      //       //
      //       // CupertinoContextMenu(
      //       //     actions: [
      //       //       CupertinoContextMenuAction(
      //       //           child: Text("Hindi"),
      //       //       onPressed: () {
      //       //
      //       //       },),
      //       //       CupertinoContextMenuAction(
      //       //         child: Text("Gujrati"),
      //       //         onPressed: () {
      //       //
      //       //         },),
      //       //       CupertinoContextMenuAction(
      //       //         child: Text("French"),
      //       //         onPressed: () {
      //       //
      //       //         },),
      //       //     ],
      //       //
      //       //     child: CupertinoButton(
      //       //         child: Text("Open Context Menu"),
      //       //         onPressed: () {
      //       //
      //       //         },)
      //       // ),
      //       Text("${currentDateTime.day}/${currentDateTime.month}/${currentDateTime.year}",
      //       style: TextStyle(fontSize: 50),),
      //       CupertinoButton.filled(
      //           child: Text("Select Date"),
      //           onPressed: () {
      //             showCupertinoModalPopup(context: context,
      //                 builder: (context){
      //               return Container(
      //                 height: 200,
      //                 child: CupertinoDatePicker(
      //                     onDateTimeChanged: (val){
      //                   setState(() {
      //                     currentDateTime=val;
      //                   });
      //                 },
      //                   initialDateTime: currentDateTime,
      //                   mode: CupertinoDatePickerMode.date,
      //                   showDayOfWeek: true,
      //                   minimumYear: 2000,
      //                   maximumYear: 2040,
      //                 ),
      //               );
      //                 });
      //           },),
      //       Divider(),
      //       (currentDateTime.hour>12)
      //       ?Text("${currentDateTime.hour-12}:${currentDateTime.minute} pm",
      //       style: TextStyle(fontSize: 50),)
      //       :Text("${currentDateTime.hour}:${currentDateTime.minute} am",
      //       style: TextStyle(fontSize: 50),),
      //       CupertinoButton.filled(
      //           child: Text("SelectTime"),
      //           onPressed: () {
      //             showCupertinoModalPopup(
      //                 context: context,
      //                 builder: (context){
      //                   return Container(
      //                     height: 300,
      //                     color: CupertinoColors.white,
      //                     child: CupertinoDatePicker(
      //                         onDateTimeChanged: (val){
      //                           setState(() {
      //                             currentDateTime=val;
      //                           });
      //                         },
      //                     mode: CupertinoDatePickerMode.time,),
      //                   );
      //                 });
      //           },),
      //       Divider(),
      //       CupertinoButton.filled(child: Text("Alertdialog"),
      //           onPressed: () {
      //             showCupertinoDialog(context: context,
      //                 builder: (context){
      //               return CupertinoAlertDialog(
      //                 title: Text("AlertDialog"),
      //                 content: Text("data"),
      //                 actions: [
      //                   CupertinoDialogAction(
      //                     child: Text("Ok"),
      //                     onPressed: () {
      //                       Navigator.of(context).pop();
      //                     },
      //                   ),
      //                   CupertinoDialogAction(
      //                     child: Text("Cancel"),
      //                     isDestructiveAction:true,
      //                     onPressed: () {
      //                       Navigator.of(context).pop();
      //                     },
      //                   ),
      //                 ],
      //               );
      //                 });
      //           },)
      //     ],
      //   )
      // ),

      //TabScaffold(Bottom Navigation Bar)

      // child: CupertinoTabScaffold(
      //     tabBar: CupertinoTabBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble),label: "Chat"),
      //     BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: "Contact"),
      //     BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: "Setting"),
      //
      //   ],
      // ),
      //     tabBuilder: (context,i){
      //   return Container(
      //     alignment: Alignment.center,
      //     color: CupertinoColors.destructiveRed,
      //     child: Text("$i"),
      //   );
      //
      // }),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${initialSliderval.toInt()}",
            style: TextStyle(fontSize: 50),),

            Transform.scale(
              scale: 2,
              child: CupertinoSlider(
                min: 1,
                max: 100,
                  value:initialSliderval,
                  onChanged: (val) {
                  setState(() {
                    initialSliderval=val;
                  });
                  },),
            ),
            CupertinoSlidingSegmentedControl(
              groupValue: initialButtonval,
              children: {
                'first':Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("First"),
                ),
                'second':Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Second"),
                ),
              },
              onValueChanged: (val) {
                setState(() {
                  initialButtonval= val!;
                });

            },)
          ],
        ),
      ),
    );


  }
}
