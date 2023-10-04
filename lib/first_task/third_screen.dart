import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 30),
                alignment: Alignment.center,
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
              child: Image.asset('assets/images/flawers2.jpg',
              )),
          const Column(
            children: [
              Text(
                'Track your work.',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30
                ),
              ),
              Text(
                'Get results.',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                ),
              ),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 4.0,
              ),
              const SizedBox(width: 10,),
              CircleAvatar(
                backgroundColor: Colors.grey[400],
                radius: 4.0,
              ),
              const SizedBox(width: 10,),
              CircleAvatar(
                backgroundColor:Colors.grey[400],
                radius: 4.0,
              ),
              const SizedBox(width: 10,),
              CircleAvatar(
                backgroundColor:Colors.grey[400],
                radius: 4.0,
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: const Text(
              'Ok,got it',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                fontSize: 20
              ),
            ),
          ),
        ],
      ),
    );
  }
}
