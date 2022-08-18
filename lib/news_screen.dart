import 'package:flutter/material.dart';
import 'model.dart';

class ReadingNews extends StatelessWidget {
  final NewsApiModel model;

  const ReadingNews( {required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body:
        Container(
          margin: EdgeInsets.fromLTRB(24, 7, 24, 0),
          child: SingleChildScrollView(
            child: Column(

              children: [


                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(

                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: size.width / 1.05,
                  child: Text(
                    model.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: size.height / 3,
                  width: size.width / 1.05,
                  alignment: Alignment.center,
                  child: model.imageUrl != ""
                      ? Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,

                  )
                      : Text(
                    "Unable to load image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: size.width / 1.05,
                  child: Text(
                    model.content,
                    style: TextStyle(
                      fontFamily: 'RobotoSlab-Regular',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}