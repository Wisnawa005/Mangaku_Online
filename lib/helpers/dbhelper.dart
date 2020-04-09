//import package sqflite
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:penjualan_voucer/models/penjualan.dart';

class DbHelper{
  //deklarasikan class DbHelper
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  factory DbHelper(){
    if(_dbHelper == null) {
      _dbHelper=DbHelper._createObject();
    }
    return _dbHelper;
  }

  //mendeklarasikan nama tabel melalui initDb
  Future<Database> initDb() async {
    Directory directory=await getApplicationDocumentsDirectory();
    String path = directory.path + 'penjualan.db';
    var todoDatabase=openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  //membuat tabel sesuai dengan yang dideklarasikan
  void _createDb(Database db, int version) async{
    await db.execute('''
      CREATE TABLE penjualan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        keterangan TEXT,
        harga TEXT,
        tanggal TEXT
      )
    ''');
  }

  //fungsi yang dapat digunakan oleh class yang membutuhkan, untuk memanggil nama db
  Future<Database> get database async{
    if(_database == null){
      _database = await initDb();
    }
    return _database;
  }

  //fungsi menampilkan data
  Future<List<Map<String, dynamic>>> select() async{
    Database db = await this.database;
    var mapList=await db.query('penjualan', orderBy: 'name');
    return mapList;
  }

  //untuk insert data, field sesuai dengan class penjualan
  Future<int> insert(Penjualan object) async{
    Database db=await this.database;
    int count =await db.insert('penjualan', object.toMap());
    return count;
  }

   //untuk update data
  Future<int> update(Penjualan object) async{
    Database db=await this.database;
    int count =await db.update('penjualan',
      object.toMap(),
      where: 'id=?',
      whereArgs: [object.id]);
      return count;
  }

  //detele data
  Future<int> delete(int id) async{
    Database db=await this.database;
    int count =await db.delete('penjualan',
      where: 'id=?',
      whereArgs: [id]);
      return count;
  }

  //menampilkan data berupa list penjualan
  Future<List<Penjualan>> getPenjualanList() async{
    var penjualanMapList=await select();
    int count=penjualanMapList.length;
    print("INI HARGA $count");
    List<Penjualan> penjualanList=List<Penjualan>();
    for(int i=0; i<count; i++){
      penjualanList.add(Penjualan.fromMap(penjualanMapList[i]));
    }
    return penjualanList;
  }
}