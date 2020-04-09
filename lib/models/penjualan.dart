class Penjualan{
  //deklarasi variabel untuk menangkap inputan
  //tidak sama dg field pada tabel

  int _id;
  String _name;
  String _keterangan;
  String _harga;
  String _tanggal;

  Penjualan(this._name, this._keterangan, this._harga, this._tanggal);
  //memasukkan atribut pada map yang nantinya akan ditampilkan dan buat consturtor, 
  //agar constructor tidak error maka pada saat dipanggil, 
  //akan menggambil dari sql dan akan disimpan dalam variable

  Penjualan.fromMap(Map<String, dynamic> map){
    this._id=map['id'];
    this._name=map['name'].toString();
    this._keterangan=map['keterangan'].toString();
    this._harga=map['harga'].toString();
    this._tanggal=map['tanggal'].toString();
  }

  // membuat Getter dan setter
  //getter akan mengambil nilai yang nanti dimasukkan ke consturctor 
  int get id =>_id;
  String get name => _name;
  String get keterangan => _keterangan;
  String get harga => _harga;
  String get tanggal => _tanggal;

  //setter ini akan dipakai untuk mengembalikan nilai yang dimasukkan dari constructor 
  //per variable fungsi ini akan dipanggil pada proses pengisian data untuk form input
  //dan yang menggunakan class penjualan, sebaiknya disamakan nama fungsinya dengan variabel diatas
  
  set name(value){
    _name=value;
  }
  set keterangan(value){
    _keterangan=value;
  }
  set harga(value){
    _harga=value;
  }
  set tanggal(value){
    _tanggal=value;
  }
  //Terakhir, membuat method untuk memasukkan getter dan setter tadi ke dalam map
  //return map digunakan pada database, nama variabel disamakan dg field
  //method map ini untuk untuk membuat method update dan insert

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map= Map<String, dynamic>();
    map['id']=this._id;
    map['name']=this.name;
    map['keterangan']=this.keterangan;
    map['harga']=this.harga;
    map['tanggal']=this.tanggal;
    return map;
  }
}