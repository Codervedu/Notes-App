import 'package:flutter/material.dart';
import 'package:notes/config/app-theme.dart';
import 'package:notes/view/notes/create-note-screen.dart';
import 'package:notes/view/notes/note-detail-screen.dart';
import 'package:provider/provider.dart';

import '../../model/note.dart';
import '../../provider/note_provider.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: noteProvider.notes.length > 0
          ? ListView.builder(
              itemCount: noteProvider.notes.length,
              itemBuilder: (context, index) {
                Note curnote = noteProvider.notes[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      // Navigate to the note details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetailScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            curnote.title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            curnote.content!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                (curnote.timeStamp)!.day == DateTime.now().day
                                    ? "${(curnote.timeStamp)!.hour}:${(curnote.timeStamp)!.minute}"
                                    : (curnote.timeStamp)!.day.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(child: Text('No Notes Avilable')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryColor,
        onPressed: () {
          // Navigate to the note editor screen for creating a new note
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNoteScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
