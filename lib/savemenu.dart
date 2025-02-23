/*import 'package:flutter/material.dart';

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
        title: Text('สาระน่ารู้'),
        backgroundColor: Color.fromARGB(255, 158, 98, 76),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,        
              children: [
                Text('สาระน่ารู้เกี่ยวกับไข่',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                Image(image: AssetImage('images/s1.jpg'),width: 350,),
                SizedBox(height: 20,),

                Text('ข้อมูลทั่วไป',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text(' ไข่ที่นิยมบริโภคกันในเมืองไทย คือ ไข่ไก่ รองลงมาคือไข่เป็ด นอกจากนี้ยังมีไข่นกกระทาที่มีการบริโภคกัน ซึ่งมีขนาดเล็กมาก แต่ก็ไม่แพร่หลายเท่ากับไข่ไก่และไข่เป็ด',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Text('ประโยชน์ทางโภชนาการ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text(' ไข่เป็ดอาหารที่มีโภชนาการสูง เนื่องจากไข่ไก่1 ฟอง ( 50 กรัม) ให้พลังงานประมาณ 75 แคลอรี่ และมีโปรตีนคุณภาพสูง และมีกรดอะมิโนที่จำเป็นต่อร่างกาย ไข่แดงมีไขมันประเภทอิ่มตัว รวมถึงโอเมกา -3 ที่ลดอัตราเสี่ยงโรคหัวใจขาดเลือดไปด้วย',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('  ไข่ไก่มีแร่ธาตุสำคัญหลายชนิด เช่น แคลเซียม ฟอสฟอรัส ซึ่งจำเป็นต่อการสร้างกระดูก รวมทั้งเป็นแหล่งวิตามินที่สำคัญ เช่น วิตามินเอ บี 1 บี 2 บี 6 และวิตามิน',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('นอกจากนี้ไข่ยังทำให้เรารู้สึกอิ่มนาน เพราะร่างกายจะผลิตฮอร์โมนพีพีวายซึ่งจะสื่อสารไปที่สมองว่าไม่หิว คุณค่าของไข่ต้มสุกและไข่ลวกเท่ากัน ดังนั้นควรทานไข่สุขจะดีกว่า เราไม่ควรกินไข่ดิบเพราะในไข่ดิบอาจมีเชื้อโรค ซึ่งจะถูกทำลายไปเมื่อปรุงสุกแล้วและไข่ดิบยังย่อยยาก หากเรากินไข่ขาวดิบเข้าไปร่างกายก็ไม่สามารถดูดสารอาหารต่างๆได้ หากจะกินไข่ลวกควรให้ไข่ขาวสุกเสียก่อน',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('สมาคมโรคหัวใจของสหรัฐอเมริกาได้แนะนำให้ผู้สูงวัยสามารถรับประทานไข่ไก่ได้วันละ 1-2 ฟอง อย่างไรก็ตามหากท่านยังมีความกังวลในการควบคุมไขมันและคอเรสเตอรอล ควรเลือกทานแต่ไข่ขาวเพราะโปรตีนทั้งหมดอยู่ในไข่ขาว ส่วนไขมันอยู่ในไข่แดง นอกจากนี้สมาคมค้นคว้าและวิจัยเพื่อการพัฒนาร่างกายและจิตใจของชาวจีนแนะนำว่า หากอายุไม่เกิน 40 ปี สามารถรับประทานไข่ไก่ได้วันละ 2 ฟอง ส่วนผู้มีอายุเกิน 40 ปีขึ้นไป สามารถรับประทานได้ วันละ 1 ฟอง ในคนที่ไม่มีคอเรสเตอรอลสูง ส่วนคนที่มีคอเรสเตอรอลสูง ควรรับประทานเฉพาะไข่ขาว และหมั่นออกกำลังการเป็นประจำ จะช่วยให้คอเรสเตอรอลตัวไม่ดี กลายเป็นคอเรสเตอรอลที่มีประโยชน์',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),

                Image(image: AssetImage('images/s2.jpg'),width: 350,),
                SizedBox(height: 20,),

                Text('วิธีการเลือกซื้อไข่',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('1.ควรเลือกซื้อไข่ที่มีเปลือกไข่ที่สะอาดไม่มีมูลติดมากับเปลือกไข่',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('2.เปลือกมีผิวเรียบ แข็ง ไม่มีรอยแตก หรือรอยบุบ',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('3.เปลือกไข่สดจะมีผิวคล้ายแป้งจับดูแล้วเนียน แป้งจับดูแล้วเนียน หากเปลือกไข่ลื่นมันแสดงว่าเป็นไข่เก่า',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('4.เมื่อนำไข่ส่องดูกับแสง เป็นไข่แดงกับไข่ขาวแยกออกกันชัดเจน แสดงว่าเป็นไข่ใหม่ ส่วนไข่ที่เสียจะทึบแสง ไข่แดงกระจายตัว มีจุดเงาดำ',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('5.ไข่ไก่ มีสีเปลือกน้ำตาลอ่อน หรือเข้มปานกลาง (ในต่างประเทศจะไม่นิยมทานไข่เป็ด แต่ไข่ไก่ในต่างประเทศจะมีเปลือกเป็นสีขาวเนืองจากเป็นคนละสายพันธุ์กับที่เลี้ยงในเมืองไทย) มีขนาดเล็กกว่าไข่เป็ดเมื่อกะเทาะเปลือก ไข่เป็ด มีเปลือกสีขาว มีขนาดใหญ่กว่า',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('6.เมื่อกะเทาะเปลือกแล้ว ไข่ไก่จะมีสีแดงจะมีสีเหลือง หรือสีเหลืองอมส้มอ่อน ในขณะที่ไข่เป็ด ไข่แดงจะมีสีค่อนข้างแดงเรื่อๆ มีสีเข้มกว่าไข่ไก่ และเมื่อต้มสุกเนื้อไข่เป็ดจะแข็งกว่าไข่ไก่ เหมาะสำหรับนำไปทำไข่พะโล้',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),

                Image(image: AssetImage('images/s3.jpg'),width: 350,),
                SizedBox(height: 20,),

                Text('การเก็บรักษา',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('1.การเก็บไข่ควรเก็บไว้ทั้งลูก ไม่ควรกะเทาะเปลือกเพราะจะทำให้เสียคุณภาพของไข่ และเก็บไว้ได้ไม่นาน',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('2.เมื่อซื้อไข่มาไม่ควรล้างไข่ เพราะจะทำให้ฝุ่นแป้งหลุดออกไปเป็นการเปิดรูพรุน ทำให้เชื้อโรคผ่านเข้าไปได้ง่าย',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('3.ไม่ควรเก็บไข่ไว้ในอาหารที่มีกลิ่นฉุนอย่างกะปิ น้ำปลา',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('4.การเก็บไข่ควรเก็บไข่ไว้ในตู้เย็นที่อุณหภูมิปกติ และควรใส่ในภาชนะแล้ววางไว้บนชั้นธรรมดา ดีกว่าใส่ในช่องวางไข่ที่ฝาผนังตู้เย็นซึ่งจะมีอุณหภูมิสูงทำให้ไข่เสียเร็วกว่าที่ควร ถ้าไม่มีตู้เย็นให้วางไว้ในตะกร้าโปร่ง อากาศถ่ายเทได้ดี',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text('5.การวางไข่ควรเอาด้านแหลมลงและให้ด้านป้านอยู่ข้างบน ไข่แดงจะอยู่ตรงกลาง หากวางไข่ด้านป้านลง ไข่แดงก็จะลอยขึ้น ทำให้ไข่แดงแตกง่ายเวลาตอกไข่ เวลาเก็บไข่ควรเอาด้านแหลมลงทุกครั้ง',
                      style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),

                Text('เกร็ดเล็กเกร็ดน้อย',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('ไข่เป็นอาหารที่บริโภคกันทั่วไป จนใช้ราคาไข่เป็นตัวชี้วัดค่าครองชีพของรัฐบาลแต่ละสมัย หากราคาไข่แพงแสดงว่าค่าครองชีพแพงในเมืองไทยนิยมบริโภคไข่ในรูปแบบต่างๆทั้งต้ม นึ่ง ปิ้ง ทอด เจียว ผัด พะโล้ โดยสามารถปรุงรสเฉพาะไข่ หรือนำไปผสมกับอาหารชนิดต่างๆ เช่นมะระผัดไข่ ข้าวผัดใส่ไข่ ก๋วยเตี๋ยวผัดไทยใส่ไข่ ไข่เจียวใส่ผักต่างๆ เป็นต้น',
                      style: TextStyle(fontSize: 20),),
              ],
            ),
          ),        
        ),
      ),
    );
  }
}*/
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
