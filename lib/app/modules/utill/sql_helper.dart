import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
        """ CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
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

  static Future<sql.Database> db() async {
    return sql.openDatabase("dbtech", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
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
    final db = await SQLHelper.db();
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

    final id = await db.insert("items", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    Get.snackbar(
      "Product Added",
      "The item is added to the cart",
      colorText: Colors.white,
      backgroundColor: Colors.orangeAccent,
      snackPosition: SnackPosition.BOTTOM,
    );

    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();

    return db.query("items", orderBy: "id");
  }

  static Future<void> deleteItem(String productId) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "productID = ?", whereArgs: [productId]);
    } catch (err) {
      print("something wrong in the deleting item: $err");
    }
  }

  static Future<void> deleteAllItem() async {
    final db = await SQLHelper.db();
    try {
      await db.rawDelete("DELETE FROM items");
    } catch (err) {
      print("something wrong in the deleting item: $err");
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

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();

    return db.query("items", where: "id=?", whereArgs: [id], limit: 1);
  }
}
