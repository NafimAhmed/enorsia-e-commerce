
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;


class SQLAddressHelper{



  static Future<void> createTable(sql.Database database)async {

    await database.execute(
        """ CREATE TABLE Addressitems (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
     address TEXT,
     appertment TEXT,
     city TEXT,
     state TEXT,
     country TEXT,
     postCode TEXT
     createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)"""
    );
  }



  static Future<sql.Database> db()async {
    return sql.openDatabase(
        "dbAddresstech",
        version: 1,
        onCreate: (sql.Database database,int version) async
        {
          await createTable(database);
        }
    );

  }

  static Future<int> createItem(String address,String appertment,String city,String state,String country,String postCode)async{




    final db=await SQLAddressHelper.db();
    final data={
      "address": "${address}",
      "appertment": "${appertment}",
      "city": "${city}",
      "state": "${state}",
      "country": "${country}",
      "postCode": "${postCode}"//cardIssuer,
    };

    final id=await db.insert("Addressitems", data,conflictAlgorithm: sql.ConflictAlgorithm.replace);


    Get.snackbar(
      "Success",
      "the card is Saved",
      colorText: Colors.white,
      backgroundColor: Colors.orangeAccent,
      snackPosition: SnackPosition.BOTTOM,
    );




    return id;


  }


  static Future<List<Map<String,dynamic>>> getItems() async {
    final db=await SQLAddressHelper.db();

    return db.query("Addressitems",orderBy: "id");
  }

  static Future<void> deleteItem(int id) async {
    final db=await SQLAddressHelper.db();
    try{
      await db.delete("Addressitems",where: "id = ?",whereArgs: [id]);
    }catch(err){
      print("something wrong in the deleting address: ${err}");
    }
  }


  static Future<List<Map<String,dynamic>>> getItem(int id)async{
    final db=await SQLAddressHelper.db();

    return db.query("Addressitems",where: "id=?",whereArgs: [id],limit: 1);

  }





  // void successMessage(BuildContext context){
  //
  //   WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
  //     showDialog(context: context, builder: (context)=>AlertDialog(
  //       content: SingleChildScrollView(
  //         child: Container(
  //           padding: EdgeInsets.all(5),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //
  //               Image.asset("assets/images/checked.png"),
  //
  //               SizedBox(height: 14,),
  //
  //
  //               Text("Product has been added to the Bag",
  //                 style: GoogleFonts.poppins(
  //                     fontSize: 12
  //                 ),
  //               ),
  //
  //               Text("SUCCESSFULLY",
  //                 style: GoogleFonts.poppins(
  //                     fontSize: 22,
  //                     fontWeight: FontWeight.w900,
  //                     color: Color.fromARGB(255,238, 98, 49)
  //                 ),
  //               ),
  //
  //
  //               SizedBox(height: 14,),
  //
  //
  //
  //               SizedBox(height: 50,),
  //
  //
  //               // Container(
  //               //   // padding: EdgeInsets.symmetric(vertical:11,horizontal: 0.07),
  //               //   child: Container(
  //               //       padding: EdgeInsets.symmetric(vertical:11,horizontal:screenWidth* 0.07),
  //               //       child: Text("Track my orders")),
  //               //   decoration: BoxDecoration(
  //               //       border: Border.all(
  //               //           color: Color.fromARGB(255,238, 98, 49)
  //               //       )
  //               //   ),
  //               // )
  //
  //
  //
  //             ],
  //           ),
  //         ),
  //       ),
  //
  //
  //       actions: [
  //
  //         // Text("A link will be sent via email"),
  //
  //         // ElevatedButton(
  //         //   onPressed: () async {
  //         //
  //         //     //PasswordReset(passwordResetController.text,context);
  //         //
  //         //
  //         //   },
  //         //   style: ElevatedButton.styleFrom(
  //         //     padding: EdgeInsets.symmetric(
  //         //         horizontal: 20, vertical: 2),
  //         //     backgroundColor: Colors.black,
  //         //     shape: StadiumBorder(),
  //         //   ),
  //         //   child: Text(
  //         //     "Reset",
  //         //     style: TextStyle(color: Colors.white, fontSize: 18,
  //         //         fontWeight: FontWeight.bold
  //         //     ),
  //         //   ),
  //         // ),
  //
  //       ],
  //     ));
  //   });
  //
  //
  // }





}