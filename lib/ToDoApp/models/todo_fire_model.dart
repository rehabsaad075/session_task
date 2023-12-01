import 'package:cloud_firestore/cloud_firestore.dart';

class TodoFireModel{
  String ?title;
  String ?description;
  String ?startDate;
  String ?endDate;
  DocumentReference ?id;
  String ?userId;
  String ?status;
  String ?image;
  TodoFireModel({
    this.title,
    this.id,
    this.endDate,
    this.startDate,
    this.description,
    this.userId,
    this.status,
    this.image,
  });
  TodoFireModel.fromFireStore(Map<String,dynamic>json,{required this.id}){
    title=json['title'];
    description=json['description'];
    startDate=json['start_date'];
    endDate=json['end_date'];
    userId=json['userId'];
    status=json['status'];
    id=json['id'];
    image=json['image'];
  }

  Map<String,dynamic>toFireStore(){
    final Map<String,dynamic>data=<String,dynamic>{};
    data['title']=title;
    data['description']=description;
    data['startDate']=startDate;
    data['endDate']=endDate;
    data['userId']=userId;
    data['status']=status;
    data['image']=image;
    return data;
  }
}