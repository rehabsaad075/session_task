import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);
final List<ContainerModel>containers=const[
  ContainerModel(
      color: Colors.yellow,
      text: 'yellow',
  ),
  ContainerModel(
    color: Colors.lime,
    text: 'lime',
  ),
  ContainerModel(
    color: Colors.brown,
    text: 'brown',
  ),
  ContainerModel(
    color: Colors.orange,
    text: 'orange',
  ),
  ContainerModel(
    color: Colors.lightGreen,
    text: 'lightGreen',
  ),
  ContainerModel(
    color: Colors.orangeAccent,
    text: 'orangeAccent',
  ),
  ContainerModel(
    color: Colors.limeAccent,
    text: 'limeAccent',
  ),
  ContainerModel(
    color: Colors.amber,
    text: 'amber',
  ),
  ContainerModel(
    color: Colors.deepOrangeAccent,
    text: 'deepOrangeAccent',
  ),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context,index){
          return  ItemContainer(model:containers[index] ,);
        },
        itemCount: containers.length,
      ),
    );
  }
}
class ItemContainer extends StatelessWidget {
  const ItemContainer({Key? key, required this.model,}) : super(key: key);
  final ContainerModel model;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(20),
      color:model.color,
      alignment: Alignment.center,
      height: 100,
      width: 100,
      child: Text(
        model.text,
        style: const TextStyle(
          fontSize: 20
        ),
      ),
    );
  }
}

class ContainerModel{
 final Color color;
 final String text;
 const ContainerModel({
    required this.color,
    required this.text,
  });
}