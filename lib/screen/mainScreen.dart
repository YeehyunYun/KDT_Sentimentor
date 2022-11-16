import 'package:KDT_SENTIMENTO/screen/AAC/aacCategory_fb.dart';
import 'package:KDT_SENTIMENTO/screen/home/component/appbar.dart';
import 'package:KDT_SENTIMENTO/screen/home/component/drawer.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'AAC/aacCategory.dart'; //////////////////////////////////////////////////
import 'home/home.dart';
import 'Setting/setting.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreens";
  @override
  _MainScreenState createState() => _MainScreenState();
}

// class To_home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//         child: IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: ((context) => Home())));
//             },
//             icon: Icon(Icons.arrow_back_ios))
//     );
//   }
// }


// class Home_to extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // return MaterialApp(home: Home());
//     // return MaterialPageRoute(builder: ((context) => Home()))
//     // return Navigator.push(context, MaterialPageRoute(builder: ((context) => Home())));
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: Builder(
//           builder: (context)
//     {
//       return FloatingActionButton(
//           onPressed: () {
//             showDialog(context: context, builder: (context) {
//               return Dialog(
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: ((context) => Home())));
//                   },
//                   icon: Icon(Icons.arrow_back_ios))
//               );
//             });
//           }
//       );
//     }
//       ),
//     appBar: AppBar(),
//       body: ListView.builder(
//         itemCount: 3,
//         itemBuilder: (c, i){
//           return ListTile(
//             leading: Icon(Icons.arrow_back_ios),
//           );
//         }
//       )
//       )
//     );
//   }
// }

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: MainDrawer(
          ),
          appBar: MainAppBar(appBar: AppBar()),
          body: PageView(
            children: [ ////////////////////////////////////AacCategory로 변경
              [Home(), AacCategoryfb(title: 'aacScreenfb',), Setting(),][selectedIndex],
            ],
          ),
          // IndexedStack(
          //   index: _selectedIndex,
          //   children: [
          //     Home(),
          //     actingScreen(),
          //     sentScreen(),
          //   ],//새봄코드
          // ),
          bottomNavigationBar:BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.pink.shade100,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.pink.shade200,
            onTap: (i) {
              setState((){
                selectedIndex = i;
                print(i);
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                      // color: Color.fromRGBO(226, 167, 194, 1.0),)),
                label: "홈",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer_rounded),
                        //color: Color.fromRGBO(226, 167, 194, 1.0),)),
                  label: "AAC"),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                      //color: Color.fromRGBO(226, 167, 194, 1.0),)),
                label: "설정",),
            ],
          )
      );
  }

}