import 'package:eraasoft_first_project/first_task/componets.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            )
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: (){},
          ),
        ),
        title: const Text(
          'Transfer Request',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
        ),
        centerTitle: true,
        actions:  [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )
            ),
            child: IconButton(
              icon: const Icon(Icons.search,
                color: Colors.black,),
              onPressed: (){},
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                'Today,25 June',
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
            ),
             BuildRowItem(
                image: 'assets/images/apple image.png',
                nameStore: 'Apple Store',
                dateStore: '21 june,2022',
                price: r'-$220.00' ,
                priceWay: 'Debit Card',
            ),
            BuildRowItem(
              image: 'assets/images/netflix.png',
              nameStore: 'Netflix',
              dateStore: '20 june,2022',
              price: r'-$170.00' ,
              priceWay: 'Debit Card',
            ),
            BuildRowItem(
              image: 'assets/images/spotify.png',
              nameStore: 'Spotify',
              dateStore:  '20 june,2022',
              price: r'-$54.00' ,
              priceWay:  'credit Card',
            ),
            BuildRowItem(
              image: 'assets/images/dribbble.jpg',
              nameStore: 'Dribbble',
              dateStore: '18 june,2022',
              price: r'-$107.00' ,
              priceWay: 'Debit Card',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:  Text(
                'Yesterday',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            ),
            BuildRowItem(
              image: 'assets/images/behance.png',
              nameStore: 'Behance',
              dateStore:  '18 june,2022',
              price: r'-$27.00' ,
              priceWay:  'credit Card',
            ),
            BuildRowItem(
              image: 'assets/images/linkedin.jpg',
              nameStore: 'Linkedin',
              dateStore:  '18 june,2022',
              price: r'-$27.00' ,
              priceWay:  'Debit Card',
            ),
            BuildRowItem(
              image: 'assets/images/snapchat.png',
              nameStore: 'Snapchat Ads',
              dateStore:  '21 june,2022',
              price: r'-$130.00' ,
              priceWay:  'credit Card',

            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                '20 June,2022',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            ),
            BuildRowItem(
              image: 'assets/images/skype.jpg',
              nameStore: 'Skype premium',
              dateStore:  '20 june,2022',
              price: r'-$56.00' ,
              priceWay:  'Debit Card',
            ),
            BuildRowItem(
              image: 'assets/images/figma.jpg',
              nameStore: 'Figma',
              dateStore:  '20 june,2022',
              price: r'-$98.00' ,
              priceWay:  'credit Card',
            ),
          ],
        ),
      ),
    );
  }
}
