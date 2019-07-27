import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';


class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {


  _listarVideos(){
    Api api = Api();
    Future<List<Video>> videos;
    return api.pesquisar('');
  }




  @override
  Widget build(BuildContext context) {

    Api api = Api();

    api.pesquisar('');

    return FutureBuilder<List<Video>>(
      future: _listarVideos() ,
      builder: (context,snapshot){

        switch(snapshot.connectionState){

          case ConnectionState.none:
          case ConnectionState.waiting:

            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:

            if(snapshot.hasData){

              return ListView.separated(
                  itemBuilder: (context,index){
                    List<Video> videos = snapshot.data;
                    Video video =videos[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(video.imagem),
                                fit: BoxFit.cover
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context,index)=>Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length
              );

            }else{
              return Text('Nenhum dado a ser exibido!');
            }

          break;


        }


      },
    );
  }
}
