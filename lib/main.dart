import 'package:flutter/material.dart';
import 'package:get_apitesting/specialisation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpecialisationProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyData(),
      ),
    );
  }
}

class MyData extends StatefulWidget {
  const MyData({Key key}) : super(key: key);

  @override
  _MyDataState createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  SpecialisationProvider specialisationProvider = SpecialisationProvider();

  @override
  void initState() {
    specialisationProvider.getAllSpecilasation().then((value) {
      setState(() {
        //specialisationProvider.toggleDone();
      print(specialisationProvider.apiHit);    
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SpecialisationProvider>(context);
    return Scaffold(
        body:model.getAPiHit? ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: model.yourSkills.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.only(left: 8, bottom: 8),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(model.yourSkills.data[index].specialisation,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14)));
            }):Center(child: CircularProgressIndicator())
            );
  }
}
