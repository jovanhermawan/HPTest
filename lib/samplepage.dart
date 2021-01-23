import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hiapp/post.dart';

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  // TODO: parse and populate the posts from postContent.json
  List<Post>listPosts = [];
  var loading = false;

  Future<Null> takeData() async {
    setState(() {
      loading = true;
    });
    var datajson = 'assets/postContent.json';
    final responding =
      await DefaultAssetBundle.of(context).loadString(datajson);
    var data = jsonDecode(responding);
    setState((){
      for(Map i in data){
        listPosts.add(Post.fromJson(i));
      }
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    takeData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("HiPals"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listPosts.length,
          itemBuilder: (context, i){
            final pcs = listPosts[i];
            return Card(
                color: Colors.brown[50],
                elevation: 10,
                child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[Image.network(pcs.forumImageUrl),
                    SizedBox(width:10),
                    Text(
                      pcs.forumName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize:17,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(width:10),
                    Image.network(pcs.locationFlagUrl),
                      ],),
                    Text(
                        pcs.title,
                        style: TextStyle(
                          fontFamily: 'OpenSansReg',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                    ),
                    Text(pcs.content,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize:16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Image.network(pcs.imageUrls[0], width:220, height:150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Column(
                          children:[Text("Likes: " + pcs.like.toString(), style: TextStyle(fontFamily: 'OpenSans'),),]
                        ),
                        Column(
                          children:[Text("Comments: " + pcs.comment.toString(), style: TextStyle(fontFamily: 'OpenSans'),),]
                        ),
                        Column(
                            children:[Text("Views: " + pcs.view.toString(), style: TextStyle(fontFamily: 'OpenSans'),),]
                        ),
                      ],

                    ),
                  ],
                ),
              )
            );
          }
        )
      )
    );
  }
}
