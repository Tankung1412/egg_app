import 'package:flutter/material.dart';

class DetailMenu extends StatefulWidget {
  const DetailMenu({super.key});

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    var mn = args['mn'];
    var rm = args['rm'];
    var dc = args['dc'];
    var st = args['st'];
    var img = args['img'];
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        title: Text(mn),
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            content1(img, mn, st, rm, dc),
            SizedBox(height: 10,),
          ],
        ),
      )

    );
  }

  Widget content1(String img, mn, st, rm, dc){
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myImg(context, img),
            SizedBox(height: 10,),
            Text(mn, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ความยาก : ',style: TextStyle(fontSize: 25),),
                SizedBox(width: 5,),
                buildStarRating(st),
              ],
            ),
            SizedBox(height: 20,),
            Text('วัตถุดิบ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text(rm,style: TextStyle(fontSize: 20,),),
            SizedBox(height: 20,),
            Text('วิธีทำ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text(dc,style: TextStyle(fontSize: 20,),),

          ],
        ),
      );
  }

  Widget myImg(BuildContext context, String img){
    return Container(
      width: 405,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30))
      ),
      child: Image(image: AssetImage(img)),
    );
  }

  Widget buildStarRating(int starCount) {
  return Row(
    mainAxisSize: MainAxisSize.min, // ให้ขนาดพอดีกับจำนวนดาว
    children: List.generate(5, (index) {
      if (index < starCount) {
        return const Icon(Icons.star, color: Color.fromARGB(255, 0, 0, 0), size: 30);
      } else {
        return const Icon(Icons.star_border, color: Color.fromARGB(255, 0, 0, 0), size: 30);
      }
    }),
  );
}
}