class TodoFireModel{
  String ?title;
  String ?description;
  String ?startDate;
  String ?endDate;
  String ?id;
  String ?userId;
  TodoFireModel(
      this.title,
      this.id,
      this.endDate,
      this.startDate,
      this.description,
      this.userId,
      );
  TodoFireModel.fromFireStore(Map<String,dynamic>json,{this.id}){
    title=json['title'];
    description=json['description'];
    startDate=json['start_date'];
    endDate=json['end_date'];
    userId=json['userId'];
  }
}