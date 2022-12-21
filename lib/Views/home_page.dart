import 'package:flutter/material.dart';
import 'package:postcodeapp/Services/remore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static _HomePageState myState(BuildContext context) => _myState;
  static _HomePageState _myState;

  @override
  State<HomePage> createState() => _HomePageState();
  Set<_HomePageState> createState2() => {
    _myState = new _HomePageState();
    return _myState;
  };
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  RegExp postcodeCheck = RegExp(r'^[0-9]{4}\s?[A-Z|a-z]{2}');
  var txt = TextEditingController();
  var postcode;

  postcodeData() {
     return postcode;
  }

  List<dynamic>? housenumbers;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }
  getData() async {
    housenumbers = await RemoteServiceHouse().getHouseNumbers();
    if (housenumbers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: txt,
                  textCapitalization: TextCapitalization.characters,
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: 'Postcode'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    postcode = value.toUpperCase();
                    bool postcodeChecked = postcodeCheck.hasMatch(postcode);
                    if (!postcodeChecked){
                      return 'Postcode format klopt niet';
                    }
                    setState(() {
                      txt.text = value.toUpperCase();
                    });

                    return '${postcodeChecked.toString()} \n$postcode \n$housenumbers';
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      
                    }
                      

                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HouseNumberState extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(



          child: ElevatedButton(
            onPressed: () {



            },
            child: const Text('hoi'),
          ),
        ),
      ),
    );
  }
}