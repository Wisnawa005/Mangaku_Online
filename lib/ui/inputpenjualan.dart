import 'package:flutter/material.dart';
import 'package:penjualan_voucer/models/penjualan.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class InputPenjualan extends StatefulWidget {
  final Penjualan penjualan;
  InputPenjualan(this.penjualan);
  @override
  _InputPenjualanState createState() => _InputPenjualanState(this.penjualan);
}

class _InputPenjualanState extends State<InputPenjualan> {
  //deklarasi variabel penjualan mewakili class Penjualan 
  Penjualan penjualan;
  //menerima data penjualan
  _InputPenjualanState(this.penjualan);
  TextEditingController nameController=TextEditingController();
  TextEditingController keteranganController =TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  final format=DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    //inisialisasi data untuk form edit
    if(penjualan != null){
      nameController.text=penjualan.name;
      keteranganController.text=penjualan.keterangan;
      hargaController.text=penjualan.harga;
      tanggalController.text=penjualan.tanggal;
    }
    return Scaffold(
      appBar: AppBar(
        //menampilkan pesan berbeda untuk add dan update 
        title: penjualan==null
          ? Text("Transaksi Baru")
          : Text("Update Transaksi"),
        leading: Icon(Icons.keyboard_arrow_left),
      ),

    body: Padding(
      padding: EdgeInsets.only(
        top: 15.0, left: 10.0, right: 10.0
      ),
      child: ListView(
        children: <Widget>[
          //menggunakan widget padding, atau yang lain
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              //variabel nameController 
              controller: nameController,
              keyboardType: TextInputType.text,
              //memberikan desain termasuk label 
              decoration: InputDecoration(
                labelText: "Nama Komik",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0)
                ),
              ),
              onChanged: (value){},
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: keteranganController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Sinopsis Komik",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0)
                ),
              ),
              onChanged: (value){},
            ),
          ),          

          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Harga",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0)
                ),
              ),
              onChanged: (value){},
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                //widget DateTimeField terdapat pada package datetime_picker_formfield
                DateTimeField(
                  controller: tanggalController,
                  format: format,
                  onShowPicker: (context, currentValue){
                    return showDatePicker(
                      //setting datepicker
                      context: context,
                      firstDate: DateTime(2020),
                      initialDate: currentValue??DateTime.now(),
                      lastDate: DateTime(2045)
                    );
                  },
                  decoration: InputDecoration(
                    labelText: "Tanggal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)
                    ),
                  )
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text("Simpan", textScaleFactor: 1.5,),
                    onPressed: (){
                      if(penjualan == null){
                        //jika data penjualan null maka dianggap data baru
                        penjualan=Penjualan(
                          nameController.text,
                          keteranganController. text,
                          hargaController.text,
                          tanggalController.text
                        );
                      }else {
                        //jika ditemukan data penjualan maka dianggap update
                        //menggunakan data sebelumnya atau sesuai variabel controller
                        penjualan.name=nameController.text;
                        penjualan.keterangan=keteranganController.text;
                        penjualan.harga=hargaController.text;
                        penjualan.tanggal=tanggalController.text;
                        print("ini Update ya"); 
                      }
                      Navigator.pop(context, penjualan);
                    },
                  ),
                ),

                Container(width: 5.0,),
                Expanded(
                  //untuk batal
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text("Batal", textScaleFactor: 1.5,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
      ),
    ); 
  }
}