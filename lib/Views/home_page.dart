import 'package:flutter/material.dart';
import 'package:postcodeapp/Services/remore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final postcodeCheck = RegExp(r'^[0-9]{4}\s?[A-Z|a-z]{2}');
  final _postcodeTextController = TextEditingController();
  final _remoteServiceHouse = RemoteServiceHouse();
  String _postcode = "";

  postcodeData() {
     return _postcode;
  }

  List<dynamic>? _houseNumbers;
  var _isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _postcodeTextController.dispose();
    super.dispose();
  }

  getData() async {
    setState(() {
      _isLoaded = true;
    });
    String pc = _postcodeTextController.text;
    if (pc == "") return;

    _houseNumbers = await _remoteServiceHouse.getHouseNumbers(pc);
    if (_houseNumbers != null) {
      setState(() {
        _isLoaded = false;
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
                  controller: _postcodeTextController,
                  textCapitalization: TextCapitalization.characters,
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  onSaved: (value) {
                    getData();
                  },
                  decoration: const InputDecoration(
                      labelText: 'Postcode'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    var postcode = value.toUpperCase();
                    bool postcodeChecked = postcodeCheck.hasMatch(postcode);
                    if (!postcodeChecked){
                      return 'Postcode format klopt niet';
                    }
                    setState(() {
                      _postcode = postcode;
                    });

                    return null;
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
                      _formKey.currentState!.save();
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