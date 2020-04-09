import 'package:flutter/material.dart';

//package datepicker 
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget. 
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final format=DateFormat('yyyy-MM-dd');
  List<String> options = <String>['Pilihan 1', 'Pilihan 2', 'Pilihan 3', 'Pilhan 4'];
  String dropdownValue = 'Pilihan 1';
  
  @override
   Widget build(BuildContext context) {
     // Build a Form widget using the _formKey created above.
     return Form(
       child: ListView(
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               validator: (value) {
                 if (value.isEmpty)
                 {
                   return 'Mohon isi Nama Lengkap anda';
                 }
                 return null;
               },
               controller: nameController,
               decoration: InputDecoration(
                 labelText: "Nama",
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(3.0)
                 ),
               )
             ),
            ),
            
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: jumlahController,
                //textfield type number
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jumlah",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty){
                    return 'Mohon Isi dengan angka';
                  }
                  return null;
                },
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: emailController,
                //textfield type number
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty){
                    return 'Mohon Isi dengan email';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                hint: new Text("Pilih satu"),
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                style: TextStyle(
                  color: Colors.deepOrange
                ),
                onChanged: (String newValue){
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                
                items: options.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                    );
                }).toList(),
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
                      //setting datepicker 
                      return showDatePicker(
                        context: context,
                        initialDate: DateTime(2020), 
                        firstDate: currentValue??DateTime.now(), 
                        lastDate: DateTime(2050)
                        );
                    },
                    decoration: InputDecoration(
                      labelText: "Tanggal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0)
                      ),
                    ),
                    validator: (DateTime dateTime){
                      if (dateTime == null) {
                        return "Mohon diisi tanggalnya";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: (){
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}