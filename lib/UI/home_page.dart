import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_project/add_post.dart';
import 'package:firebase_project/login_page.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  Future<void> _showMyDialog(String title, String id) async {
    editController.text = title;
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update'),
          content: Container(
            child: TextField(
              controller: editController,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.child(id).update({
                    'name' : editController.text.toLowerCase()
                  }).then((value) {
                    Utils().toastMessage('Post Updated');
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                },
                child: Text('Update')),
          ],
        );
      },
    );
  }

  final editController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('post');
  final auth = FirebaseAuth.instance;
  final searchFilterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Home Screen'),
        actions: [
          ElevatedButton(
            child: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchFilterController,
              decoration: InputDecoration(
                  hintText: 'Search', border: OutlineInputBorder()),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
                defaultChild: Center(child: Text('Loading....',style: TextStyle(fontSize: 20),)),
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  final title = snapshot.child('name').value.toString();
                  final id = snapshot.child('id').value.toString();
                  if (searchFilterController.text.isEmpty) {
                    return ListTile(
                      onTap: (){},
                      title: Text(
                        title,
                        // snapshot.child('name').value.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        id,
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              _showMyDialog(title,snapshot.child('id').value.toString());
                            },
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                          )),
                          PopupMenuItem(
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  ref.child(snapshot.child('id').value.toString()).remove();
                                  },
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                          )),
                        ],
                      ),
                    );
                  }
                  else if (title.toLowerCase().contains(searchFilterController.text.toLowerCase().toString()) ||
                      id.toLowerCase().contains(searchFilterController.text.toLowerCase().toString())) {
                    return ListTile(
                      title: Text(
                        snapshot.child('name').value.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        snapshot.child('id').value.toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                    );
                  }
                  else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }
}
