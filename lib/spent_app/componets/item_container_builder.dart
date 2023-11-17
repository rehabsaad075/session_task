import 'package:eraasoft_first_project/spent_app/componets/text_custom.dart';
import 'package:eraasoft_first_project/spent_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ItemContainerBuilder extends StatelessWidget {
  const ItemContainerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.containerColor
      ),
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Image.network('src'),
           Column(
            children: [
              Row(
                children: [
                  const TextCustom(
                      text: 'Groceries',
                    color: AppColors.grey,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.keyboard_arrow_down)
                  ),
                ],
              ),
              const Row(
                children: [
                  TextCustom(
                      text: '\$21 ',
                    fontWeight: FontWeight.bold,
                  ),
                  TextCustom(
                    text: '/ \$400 ',
                    color: AppColors.grey,
                  ),
                ],
              ),
              const TextCustom(
                text: '- \$379 ',
                color: AppColors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
