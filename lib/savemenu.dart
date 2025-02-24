import 'package:flutter/material.dart';
import 'package:food_app/data.dart';

class SaveMenu extends StatefulWidget {
  const SaveMenu({super.key});

  @override
  State<SaveMenu> createState() => _SaveMenuState();
}

class _SaveMenuState extends State<SaveMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 170),
      appBar: AppBar(
        title: const Text('เมนูที่บันทึกไว้'),
        backgroundColor: const Color.fromARGB(255, 158, 98, 76),
      ),
      body: Data.lstSavedMenu.isEmpty
          ? const Center(
              child: Text(
                "ไม่มีเมนูที่บันทึกไว้",
                style: TextStyle(fontSize: 20),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: Data.lstSavedMenu.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  final menu = Data.lstSavedMenu[index];
                  final menuName = menu['menu_name'];
                  final img = menu['img'];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/m_dt', arguments: {
                        'mn': menu['menu_name'],
                        'rm': menu['raw_mat'],
                        'dc': menu['descrip'],
                        'st': menu['star'],
                        'img': menu['img'],
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
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
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  Data.lstSavedMenu.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
