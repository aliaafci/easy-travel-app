import 'package:flutter/material.dart';
class ImageGridView extends StatefulWidget {
   int crossAxisCount ;
   List imagesList ;

  ImageGridView({@required this.crossAxisCount,@required this.imagesList});

  @override
  _ImageGridViewState createState() => _ImageGridViewState(this.crossAxisCount,this.imagesList);
}

class _ImageGridViewState extends State<ImageGridView> {
  int crossAxisCount ;
  List imagesList ;

  _ImageGridViewState(this.crossAxisCount,this.imagesList,);

  @override
  Widget build(BuildContext context) {
    return _gridView();

  }
  _gridView(){
    return CustomScrollView(
      primary: false,
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(4.0),
          sliver: SliverGrid.count(
//            crossAxisSpacing: 10.0,
            crossAxisCount: crossAxisCount,

              children:List.generate(imagesList.length, (index) {
                return new GestureDetector(
                  child: new Card(
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(5.0),
                        child:Image.asset(
                          imagesList[index],
                          fit: BoxFit.fill,
                        ),
                      )
                  ),
                  onTap: () {
                  },
                );
              }),
          ),
        ),
      ],
    );
  }

//  _gridView(){
//    return
//      new GridView.builder(
//shrinkWrap: true,
//        scrollDirection: Axis.vertical,
//        itemCount: imagesList.length,
//        gridDelegate:
//        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:crossAxisCount ),
//        itemBuilder: (BuildContext context, int index) {
//          return new GestureDetector(
//            child: new Card(
//                              child: new ClipRRect(
//                  borderRadius: new BorderRadius.circular(5.0),
//                  child:Image.asset(
//                    imagesList[index],
//                    fit: BoxFit.fill,
//                  ),
//                )
//            ),
//            onTap: () {
//            },
//          );
//        });
//  }

}
