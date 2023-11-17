import 'package:eraasoft_first_project/spent_app/componets/text_custom.dart';
import 'package:eraasoft_first_project/spent_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'componets/item_container_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const TextCustom(
          text: 'Hi Jim',
          fontSize: 15,
          color: AppColors.grey,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.account_tree_outlined),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextCustom(
                text: 'You\'ve already spent ',
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.grey
                )
              ),
              child: const Row(
                children: [
                  TextCustom(
                    text: '\$1 123,22',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const TextCustom(
              text: 'and there\'s still 18 days left until payday',
              color: AppColors.grey,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index)=>const ItemContainerBuilder(),
                  separatorBuilder:(context,index)=>const SizedBox(height: 20,),
                  itemCount: 5
              ),
            )
          ],
        ),
      ),
    );
  }
}
