import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/model/Video.dart';
const CHAVE_YOUTUBE_API ='AIzaSyA1Xlut4e8mgoMzwnEK3YLNnWxf6I0Irjo';
const ID_CANAL ='UCVHFbqXqoYvEWM1Ddxl0QDg';
const URL_BASE ='https://www.googleapis.com/youtube/v3/';


class Api{
  Future<List<Video>> pesquisar(String pesquisa)async{

    http.Response response = await http.get(
      URL_BASE + 'search'
          '?part=snippet'
          '&type=video'
          '&maxResults=20'
          '&order=date'
          '&key=$CHAVE_YOUTUBE_API'
          '&channelId=$ID_CANAL'
          '&q=$pesquisa'
    );
    
    if(response.statusCode==200){

      print('data'+ response.statusCode.toString());
      Map<String, dynamic> dadosJson =json.decode(response.body);


      List<Video> videos=dadosJson["items"].map<Video>(
          (map){
            
            return Video.fromjson(map);
            //return Video.convertrJson(map);

          }
      ).toList();      
      
      return videos;


      /*
      for(var video in dadosJson["items"]){

        print(' Resultado: ' + video.toString());

      }*/
      //print(' Resultado: ' + dadosJson["items"].toString());

    }else{
      
    }
    

  }
}