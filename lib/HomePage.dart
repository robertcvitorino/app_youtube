import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual=0;
  String _resultado ="";
  @override
  Widget build(BuildContext context) {

    List<Widget>  telas =[
          Inicio(_resultado),
          EmAlta(),
          Inscricao(),
          Biblioteca()
        ];
    return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.grey,
                opacity: 0.8
              ),
              title:Image.asset(
                  'img/youtube.png',
                width: 98,
                height: 22,
              ),

              actions: <Widget>[
                /*

                IconButton(
                    icon: Icon(Icons.videocam),
                    onPressed:(){
                      print('acao :Videos Cam');
                    }
                ),

                IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed:(){
                      print('acao :Videos Conta');
                    }
                ),*/

                IconButton(
                    icon: Icon(Icons.search),
                    onPressed:() async{
                    String res= await showSearch(context: context,
                         delegate: CustomSearchDelegate());
                    setState(() {
                      _resultado=res;
                    });
                     }
                ),
              ],
              backgroundColor: Colors.white,
            ),













      body: Container(
        padding: EdgeInsets.all(15),
        child: telas[_indiceAtual],
      ),

















      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice ){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.green,
                title: Text('Inicio'),
                icon: Icon(Icons.home)
            ), BottomNavigationBarItem(
                //backgroundColor: Colors.orange,
                title: Text('Em Alta'),
                icon: Icon(Icons.whatshot)
            ),BottomNavigationBarItem(
               // backgroundColor: Colors.red,
                title: Text('Inscrições'),
                icon: Icon(Icons.subscriptions)
            ),BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                title: Text('Biblioteca'),
                icon: Icon(Icons.folder)
            )
          ]
      ),
    );
  }
}
