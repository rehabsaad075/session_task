import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({super.key, required this.icon,required this.text});
final IconData icon;
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: ListTile(
        onTap: (){},
        leading:Icon(icon,color: Colors.white),
        title:  Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class BuildRowItem extends StatelessWidget {
 const  BuildRowItem({
   super.key,
   required this.image,
   required this.nameStore,
   required this.dateStore,
   required this.price,
   required this.priceWay,

 });
final String image;
final String nameStore;
 final String dateStore;
 final String price;
 final String priceWay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
              child: Image.asset(image,),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      nameStore,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const Spacer(),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    Text(
                      dateStore,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      priceWay,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

