/*import 'package:flutter/material.dart';
import 'package:postcodeapp/Services/remore_service.dart';

import '../Models/getTestData.dart';*/

/*class Testpage extends StatefulWidget {
  const Testpage({Key? key}) : super(key: key);

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  List<GetTestData>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteServiceTest().getTestData();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }*/

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(posts![index].title),
            );
          },
        ),
        replacement: const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
*/