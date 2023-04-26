import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/firestore/add_firestore_data.dart';
import 'package:firebase_project/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/login_page.dart';
class FirestoreScreen extends StatefulWidget{
  const FirestoreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FirestoreScreen();
   
  }
  
}
class _FirestoreScreen extends State<FirestoreScreen>{
  Future<void> _showConfirmDialog(String id) async {
    return await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Are you sure you want to permamently delete this post !'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('No')),
          TextButton(onPressed: (){
            Navigator.pop(context);
            ref.doc(id).delete().then((value) => Utils().toastMessage('Post Deleted')).onError((error, stackTrace) => Utils().toastMessage(error.toString()));
          }, child: Text('Yes')),

        ],
      );
    });
  }

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
                   ref.doc(id).update({
                     'title': editController.text.toString()
                   }).then((value) => Utils().toastMessage('Post Updated')
                   ).onError((error, stackTrace) => Utils().toastMessage(error.toString()));
                },
                child: Text('Update')),
          ],
        );
      },
    );
  }

  final firestore= FirebaseFirestore.instance.collection('users').snapshots();
  final ref= FirebaseFirestore.instance.collection('users');
  final editController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final searchPostController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('FireStore Screen'),
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddFireStoreData()));
        },
        child: Icon(Icons.add),
      ),


      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: TextFormField(
              controller: searchPostController,
              decoration: InputDecoration(
                hintText: 'Search Post',
                border: OutlineInputBorder(
               borderSide: BorderSide(width: 1, color: Colors.black38)
                )
              ),
              onChanged: (String value){
                setState(() {

                });
              },

            ),
          ),
          StreamBuilder(
               stream: firestore,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot ){

                 if(snapshot.connectionState== ConnectionState.waiting)
                   return Center(child: CircularProgressIndicator());
                 if(snapshot.hasError)
                   return Text('Error found');
              return Flexible(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    final title= snapshot.data!.docs[index]['title'];
                    final id= snapshot.data!.docs[index]['id'];
                  if(searchPostController.text.isEmpty)
                    return ListTile(
                      title: Text(title),
                      subtitle: Text(id),
                      trailing:
                          PopupMenuButton(
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (context) =>[
                              PopupMenuItem(
                                  child: ListTile(
                                    onTap: (){
                                       Navigator.pop(context);
                                      _showMyDialog(title, id);
                                    },
                                     title: Text('Update'),
                                     leading: Icon(Icons.edit),
                                  )
                              ),
                              PopupMenuItem(
                                  child: ListTile(
                                    onTap: (){
                                      Navigator.pop(context);
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Text('Are you sure you want to permamently delete this post !'),
                                          actions: [
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, child: Text('No')),
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                              ref.doc(snapshot.data!.docs[index]['id'].toString()).delete().then((value) => Utils().toastMessage('Post Deleted')).onError((error, stackTrace) => Utils().toastMessage(error.toString()));
                                            }, child: Text('Yes')),

                                          ],
                                        );
                                      });
                                      // _showConfirmDialog(id);
                                    },
                                     title: Text('delete'),
                                     leading: Icon(Icons.delete),
                                  )
                              ),
                            ]

                          )
                    );
                  else if(title.toString().toLowerCase().contains(searchPostController.text.toString().toLowerCase()))
                    return ListTile(
                      title: Text(title),
                      subtitle: Text(id),
                    );
                  else{
                    return Container();
                  }
                  },
                  ),
              );
              }
          )
        ],
      ),
    );
  }
  
}