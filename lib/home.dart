import 'news_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'model.dart';
import 'news_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsApiModel>? newsList;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'HEADLINES',
            style: TextStyle(
              fontFamily: 'Roboto',
              letterSpacing: 5,


              fontSize: 22,
            ),
          ),
        ),
      ),

      backgroundColor: Colors.grey.shade800,
      body:
      SingleChildScrollView(
     child:GestureDetector(
     onTap: () => Navigator.of(context).push(
     MaterialPageRoute(
     builder: (_) => ReadingNews(

      model: newsList![1],
     ),
     ),
     ),
        child: Column(
          children: [
            isLoading?
            Align(
              alignment:Alignment.center,
            child: Container(
              height: 20,
              width:  20,
              child:  CircularProgressIndicator(),
            ),)
            :Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsList?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 1,
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(newsList![index].imageUrl)
                                ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(colors: [
                                    Colors.black12.withOpacity(0),
                                        Colors.black,
                                  ],
                                       begin: Alignment.topCenter,
                                       end: Alignment.bottomCenter,
                                      )),
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsList![index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'RobotoSlab-Regular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 7,),
                                      Text(newsList![index].description.length> 50? "${newsList![index].description.substring(0,55)}.....":newsList![index].description,style: TextStyle(color: Colors.white,fontFamily: 'Roboto',fontSize: 12),),
                                    ],

                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      ),);
  }
}
