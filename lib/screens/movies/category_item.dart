import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/movies/category_list.dart';

import '../../models/Movies/categorymovies.dart';

class categoryitem extends StatelessWidget {
  Genres Category  ;
  categoryitem( this.Category);
  String image ='assets/images/action.jfif';

  @override
  Widget build(BuildContext context) {
    if(Category.name=='Action'){
      image='assets/images/action.jfif';
    }
    if(Category.name=='Adventure'){
      image='assets/images/Adventure.jfif';
    }
    if(Category.name=='Animation'){
      image='assets/images/Animation.jpeg';
    }
    if(Category.name=='Comedy'){
      image='assets/images/Comedy.jfif';
    }
    if(Category.name=='Crime'){
      image='assets/images/Crime.jfif';
    }
    if(Category.name=='Documentary'){
      image='assets/images/Documentary.jfif';
    }
    if(Category.name=='Drama'){
      image='assets/images/Drama.jpg';
    }
    if(Category.name=='Family'){
      image='assets/images/Family.jfif';
    }
    if(Category.name=='Fantasy'){
      image='assets/images/Fantasy.jpg';
    }
    if(Category.name=='History'){
      image='assets/images/History.jfif';
    }
    if(Category.name=='Horror'){
      image='assets/images/Horror.jfif';
    }
    if(Category.name=='Music'){
      image='assets/images/Music.jfif';
    }
    if(Category.name=='Mystery'){
      image='assets/images/Mystery.jfif';
    }
    if(Category.name=='Romance'){
      image='assets/images/Romance.jfif';
    }
    if(Category.name=='Science Fiction'){
      image='assets/images/Science Fiction.jfif';
    }
    if(Category.name=='TV Movie'){
      image='assets/images/TV Movie.jfif';
    }
    if(Category.name=='Thriller'){
      image='assets/images/Thriller.jfif';
    }
    if(Category.name=='War'){
      image='assets/images/War.jfif';
    }
    if(Category.name=='Western'){
      image='assets/images/Western.jfif';
    }
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, categorylist.routeName,
        arguments:Category.id??0 );
      },
      child: Container(
        child: Stack(
          children: [
            Image.asset('$image',fit: BoxFit.fill,),
            Container(
              alignment:Alignment.topCenter,
              child: Text(Category.name??'',
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
