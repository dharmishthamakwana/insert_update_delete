import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insert_update_delete/screen/home/model/stdmodel.dart';
import 'package:insert_update_delete/screen/home/provider/home_proivder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  TextEditingController txtid = TextEditingController();

  TextEditingController dtxtname = TextEditingController();
  TextEditingController dtxtstd = TextEditingController();
  TextEditingController dtxtid = TextEditingController();

  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(backgroundColor: Colors.grey.shade900,title: Text("Student Data"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: txtid,

                  decoration: InputDecoration(
                    hintText: "Enter Id",
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 10),
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    fillColor: Colors.white,
                    hintText: "Enter Name"),
              ),
              SizedBox(height: 10),

              TextField(
                controller: txtstd,
                decoration: InputDecoration(
                  hintText: "Enter STD",
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 10),
              ElevatedButton(

                  onPressed: () {
                    stddata s1 = stddata(
                        id: txtid.text, name: txtname.text, std: txtstd.text);
                    homeProvider!.add(s1);
                    txtstd.clear();
                    txtname.clear();
                    txtid.clear();

                  },
                  child: Text("Add"),),
              Expanded(

                child: Consumer<HomeProvider>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: homeProvider!.l1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${homeProvider!.l1[index].id}"),
                        title: Text("${homeProvider!.l1[index].name}"),
                        subtitle: Text("${homeProvider!.l1[index].std}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  homeProvider!.remove(index);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () {
                                  dtxtid = TextEditingController(
                                      text: "${homeProvider!.l1[index].id}");
                                  dtxtname = TextEditingController(
                                      text: "${homeProvider!.l1[index].name}");
                                  dtxtstd = TextEditingController(
                                      text: "${homeProvider!.l1[index].std}");
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: dtxtid,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextField(
                                            controller: dtxtname,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextField(
                                            controller: dtxtstd,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                       
                                        ElevatedButton(
                                            onPressed: () {
                                              stddata s1 = stddata(
                                                  std: dtxtstd.text,
                                                  name: dtxtname.text,
                                                  id: dtxtid.text);
                                              homeProvider!.update(index, s1);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Done"))
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
