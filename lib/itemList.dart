// ignore: file_names
import 'package:flutter/material.dart';

class AnimatedItems extends StatefulWidget {
  const AnimatedItems({super.key});

  @override
  State<AnimatedItems> createState() => _AnimatedItemsState();
}

class _AnimatedItemsState extends State<AnimatedItems> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  int num = 0;
  final item = [];
  void addItem(String title) {
    item.insert(0, title);
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void removeItem(int index, BuildContext context) {
    AnimatedList.of(context).removeItem(index, (context, animation) {
      return FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: Card(
            elevation: 1.0,
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: Text(item[index],
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              trailing: IconButton(
                onPressed: () {
                  item.removeAt(index);
                  removeItem(index, context);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 8, 20),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: Container(),
        title: const Text('Flutter Mapp'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (item.isEmpty) {
                      num = 0;
                    }
                    num = num + 1;
                    addItem('Item  $num');
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
            Expanded(
              child: AnimatedList(
                key: _key,
                initialItemCount: item.length,
                itemBuilder: (((context, index, animation) {
                  return FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        key: UniqueKey(),
                        sizeFactor: animation,
                        child: Card(
                          elevation: 1.0,
                          color: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            title: Text(item[index],
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            trailing: IconButton(
                              onPressed: () => removeItem(index, context),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ));
                })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
