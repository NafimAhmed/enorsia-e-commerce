//import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLWishListHelper {
  static Future<void> createWishListTable(sql.Database database) async {
    await database.execute(
        """ CREATE TABLE WishListitems (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
     imageLink TEXT,
     title TEXT,
     price TEXT,
     quantity TEXT,
     productID TEXT,
     colorID TEXT,
     sizeID TEXT,
     isChecked BOOL
     createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
  }

  static Future<sql.Database> WishListdb() async {
    return sql.openDatabase("dbWishListtech", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createWishListTable(database);
    });
  }

  static Future<int> createItem(
      String title,
      String price,
      String sizeID,
      String productID,
      String colorID,
      String quantity,
      String imageLink) async {
    final db = await SQLWishListHelper.WishListdb();
    final data = {
      "imageLink": imageLink,
      "title": title,
      "price": price,
      "quantity": quantity,
      "productID": productID,
      "colorID": colorID,
      "sizeID": sizeID,
      "ischecked": false
    };

    final id = await db.insert("WishListitems", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    Get.snackbar(
      "Success",
      "The item is added to your wish list",
      colorText: Colors.white,
      backgroundColor: Colors.orangeAccent,
      snackPosition: SnackPosition.BOTTOM,
    );

    return id;
  }

  static Future<List<Map<String, dynamic>>> WishListgetItems() async {
    final db = await SQLWishListHelper.WishListdb();

    return db.query("WishListitems", orderBy: "id");
  }

  static Future<void> WishListdeleteItem(int id) async {
    final db = await SQLWishListHelper.WishListdb();
    try {
      await db.delete("WishListitems", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("something wrong in the deleting WishListitem: ${err}");
    }
  }

  // Future<int> deleteItem(int id) async {
  //   final db=await SQLHelper.db();   // replacd with database instance
  //
  //   return await db.delete(
  //     "items",     // replace with table name
  //     where: "id = ?",
  //       whereArgs: [id]  // you need the id
  //   );
  // }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLWishListHelper.WishListdb();

    return db.query("WishListitems", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> WishListgetItem(int id) async {
    final db = await SQLWishListHelper.WishListdb();

    return db.query("WishListitems", where: "id=?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> WishListgetItemProductID(
      String productId) async {
    final db = await SQLWishListHelper.WishListdb();

    return db.query("WishListitems",
        where: "productID=?", whereArgs: [productId], limit: 1);
  }
}
