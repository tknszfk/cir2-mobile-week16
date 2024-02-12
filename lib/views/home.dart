import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _listdata = [];
  bool _isLoading = true;
  // =============Read Data==============
  Future<void> ReadData() async {
    const url = "http://192.168.1.119/crud-api/controllers/readData.php";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      // debugPrint(res.body);
      final read = jsonDecode(res.body);

      setState(() {
        _listdata.addAll(read);
        _isLoading = false;
        debugPrint('$_listdata');
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.title),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: (context, index) {
                return Card(
                  // color: Colors.orange,
                  child: ListTile(
                    title: Text(_listdata[index]['username']),
                    subtitle: Text(_listdata[index]['name']),
                    leading: CircleAvatar(
                      radius: 20.0,
                      child: Text(_listdata[index]['username']
                          .toString()
                          .substring(0, 2)
                          .toUpperCase()),
                    ),
                    trailing: Container(
                      width: 150.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, color: Colors.teal),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.list_alt_outlined,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
