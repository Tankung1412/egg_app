import 'package:flutter/material.dart';
import 'package:food_app/data.dart';

class CategoryDetail extends StatefulWidget {
  final int star;
  const CategoryDetail({super.key, required this.star});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    // กรองข้อมูลเมนูที่มี star ตรงกับที่รับเข้ามา
    final List<Map<String, dynamic>> filteredMenus = Data.lstMenu
        .where((menu) => menu['star'] == widget.star)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูระดับ ${widget.star} ดาว'),
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: GridView.builder(
          itemCount: filteredMenus.length,
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: buildGridTile(context, filteredMenus, index),
          ),
        ),
      ),
    );
  }

  Widget buildGridTile(BuildContext ctx, List<Map<String, dynamic>> menuList, int index) {
    var menu = menuList[index];
    var menuName = menu['menu_name'];
    var img = menu['img'];
    bool isSaved = Data.lstSavedMenu.any((saved) => saved['menu_name'] == menuName);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(ctx, '/m_dt',
          arguments: {
            'mn': menu['menu_name'],
            'rm': menu['raw_mat'],
            'dc': menu['descrip'],
            'st': menu['star'],
            'img': menu['img'],
          },
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.5),
            child: Text(
              menuName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                isSaved ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  bool alreadySaved = Data.lstSavedMenu
                      .any((saved) => saved['menu_name'] == menuName);
                  if (!alreadySaved) {
                    Data.lstSavedMenu.add(menu);
                  } else {
                    Data.lstSavedMenu
                        .removeWhere((saved) => saved['menu_name'] == menuName);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
