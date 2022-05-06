class dDevice{
  String? name;
  String? id;
  String? link;
  List<dynamic> ch=[];
  String? company;

  dDevice({this.name,this.id,this.link,required this.ch,this.company});

  toMap(dDevice d){
    return {
      'name':d.name,
      'id':d.id,
      'link':d.link,
      'ch':d.ch,
      'company':d.company
    };

  }

  dDevice.fromJson(Map m){
    name=m['name'];
    id=m['id'];
    link=m['link'];
    ch=m['ch'];
    company=m['company'];

  }

}