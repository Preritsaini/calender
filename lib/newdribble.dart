import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewDribble extends StatefulWidget {
  const NewDribble({super.key});

  @override
  State<NewDribble> createState() => _NewDribbleState();
}

class _NewDribbleState extends State<NewDribble> {
  bool switchValue = true;
  bool Visalue = true;
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent[100],
                      radius: 50,
                      backgroundImage: NetworkImage('https://i.ibb.co/8KTnDD7/download-3-removebg-preview.png'),
                    ),
                    SizedBox(height: 10),
                    Text('Coffeestories',style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold
                    ),),
                      Text('mark.brock@icloud.com',
                      style: TextStyle(color: Colors.grey[600],fontSize: 13),),
                    SizedBox(height: 5),
                    ElevatedButton(style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),onPressed: (){}, child: Text('Edit Profile',style: TextStyle(color: Colors.white),))
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Inventories',style: TextStyle(color: Colors.grey[600]),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[200],),
                child: Column(
                  children: [
                    ListTile(leading: Icon(Icons.store_mall_directory_outlined),
                    title: Row(
                      children: [
                        Text('My Stores'),
                        SizedBox(width: 5),
                        CircleAvatar(radius: 10,backgroundColor: Colors.green,child: Text('2',
                        style: TextStyle(color: Colors.white,fontSize: 10),),)
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_rounded,color: Colors.grey,),),
                    Divider(endIndent: 20,
                    indent: 20,),
                    ListTile(leading: Icon(Icons.support),
                      title: Row(
                        children: [
                          Text('Support'),
                          SizedBox(width: 5),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_rounded,color: Colors.grey,),),
                  ],
                ),
        
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Preferences',style: TextStyle(color: Colors.grey[600]),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[200],),
                child: Column(
                  children: [
                    ListTile(leading: Icon(CupertinoIcons.bell),
                      title: Row(
                        children: [
                          Text('Push Notification'),
                          SizedBox(width: 5),
                        ],
                      ),
                      trailing: CupertinoSwitch(
                        // This bool value toggles the switch.
                        value: switchValue,
                        activeColor: CupertinoColors.activeGreen,
                        onChanged: (bool? value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            switchValue = value ?? false;
                          });
                        },
                      ),),
                    Divider(endIndent: 20,
                      indent: 20,),
                    ListTile(leading: Icon(Icons.face_outlined),
                      title: Row(
                        children: [
                          Text('Face ID'),
                          SizedBox(width: 5),
                        ],
                      ),
                      trailing:  CupertinoSwitch(
                      // This bool value toggles the switch.
                      value: Visalue,
                      activeColor: CupertinoColors.activeGreen,
                      onChanged: (bool? value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          switchValue = value ?? false;
                        });
                      },
                    ),),
                    Divider(endIndent: 20,
                      indent: 20,),
        
                    ListTile(leading: Icon(Icons.dialpad),
                      title: Row(
                        children: [
                          Text('PIN Code'),
                          SizedBox(width: 5),
        
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_rounded,color: Colors.grey,),),
                    Divider(endIndent: 20,
                      indent: 20,),
                    ListTile(leading: Icon(Icons.logout,color: Colors.red[700],),
                      title: Row(
                        children: [
                          Text('Support',style: TextStyle(color: Colors.red[700]),),
                          SizedBox(width: 5),
                        ],
                      ),
                      ),
                      SizedBox(height: 20),
                  ],
                ),
        
              ),
            )
          ],),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        currentIndex: _selectedIndex, // Current active index
        onTap: _onItemTapped, // Handle item tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
