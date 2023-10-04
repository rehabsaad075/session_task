import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'E V A N O',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),
            ),
            const Text(
                'Everyday',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
            ),
            Container(
                height: 290,
                width: 190,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/flawers3.jpg',),
                    fit: BoxFit.fill
                  )
                ),
            ),
             Padding(
              padding: EdgeInsets.all(64.0),
              child: Text(
                'Enjoy your daily dose of positivity and ease. Inspiring guotes and texts,tranguil videos and insightful practices to caim down your mind and give you inner peace',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400]
                ),
              ),
            ),
             SizedBox(height: 50,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 5.0,
                ),
                const SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: Colors.grey[350],
                  radius: 5.0,
                ),
                const SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor:Colors.grey[350],
                  radius: 5.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
