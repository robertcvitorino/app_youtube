class Video{

  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});
  /*
  static convertrJson(Map<String,dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      descricao: json["snippet"]["description"],
      canal: json["snippet"]["channelId"],
    );
    */


    factory Video.fromjson(Map<String,dynamic> json){
      return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      descricao: json["snippet"]["description"],
      canal: json["snippet"]["channelTitle"],
      );

  }

}