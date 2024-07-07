import 'package:flutter/material.dart';

import 'create-note-screen.dart';

class NoteDetailScreen extends StatefulWidget {
  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String _selectedCollection = '';

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dummy note data for demonstration
    String noteTitle = 'Note Title';
    String noteContent = 'Note Content';
    List<String> collections = ['Collection 1', 'Collection 2', 'Collection 3'];
    String noteCollection = 'Collection 1';

    // Set initial text in controllers and selected collection
    _titleController.text = noteTitle;
    _noteController.text = noteContent;
    _selectedCollection = noteCollection;

    return Scaffold(
      appBar: AppBar(
        title: Text('Note Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to the CreateNoteScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateNoteScreen(noteId: noteTitle),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedCollection,
              items: collections.map((String collection) {
                return DropdownMenuItem<String>(
                  value: collection,
                  child: Text(collection),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    _selectedCollection = value;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Collection',
                border: OutlineInputBorder(),
              ),
              disabledHint: Text(noteCollection),
            ),
            SizedBox(height: 16.0),
            Text(
              noteContent,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
