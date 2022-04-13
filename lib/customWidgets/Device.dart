class Device{
  String? name;
  String? id;
  String? link;
  List<dynamic> ch=[];
  String? company;

  Device({this.name,this.id,this.link,required this.ch,this.company});

  toMap(Device d){
    return {
      'name':d.name,
      'id':d.id,
      'link':d.link,
      'ch':d.ch,
      'company':d.company
    };

  }

  Device.fromJson(Map m){
    this.name=m['name'];
    this.id=m['id'];
    this.link=m['link'];
    this.ch=m['ch'];
    this.company=m['company'];

  }

}