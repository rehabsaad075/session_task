import 'package:eraasoft_first_project/first_task/componets.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Colors.blue[900],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                   backgroundImage: AssetImage('assets/images/profil.jpg'),
                    radius: 35,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          'Sarah Abs',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          'Sarah@Abs.com',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                      icon: const Icon(Icons.add_comment_outlined))
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const ListTileItem(
                icon: Icons.people_alt,
                text: 'person'
            ),
            const ListTileItem(
                icon: Icons.favorite_border,
                text: 'favorite',
            ),
            const ListTileItem(
                icon:  Icons.workspaces_filled,
                text:  'Workflow',
            ),
            const ListTileItem(
                icon: Icons.update,
                text: 'Update',
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
              color: Colors.grey,
            ),
            const ListTileItem(
                icon: Icons.rectangle_outlined,
                text: 'Plugins',
            ),
            const ListTileItem(
                icon:Icons.notifications,
                text: 'Notifications',
            ),

          ],
        ),
      ),
    );
  }
}
