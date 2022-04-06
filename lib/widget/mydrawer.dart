import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final imgPath = "http://avatars.githubusercontent.com/u/88334469?v=4";
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Prasad"),
                accountEmail: Text("prasad@gmail.com"),
                currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(imgPath), // for Network image
                      ),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white),
              title: Text("Home",style: TextStyle(color: Colors.white),textScaleFactor: 1.1,),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.settings,color: Colors.white),
              title: Text("Setting",style: TextStyle(color: Colors.white),textScaleFactor: 1.1,),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white),
              title: Text("Profile",style: TextStyle(color: Colors.white),textScaleFactor: 1.1,),
            )
          ],
        ),
      ),
    );
  }
}
