import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextfieldModalBottomSheet extends StatefulWidget {
  const TextfieldModalBottomSheet(
      {super.key,
      required this.initialValue,
      required this.title,
      required this.onSave});

  final String initialValue;
  final String title;
  final void Function(String) onSave;

  @override
  State<TextfieldModalBottomSheet> createState() =>
      _TextfieldModalBottomSheetState();
}

class _TextfieldModalBottomSheetState extends State<TextfieldModalBottomSheet> {
  late TextEditingController _controller;
  String? _errorMessage;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _validateAndSave() {
    final text = _controller.text;

    if (text.isEmpty) {
      setState(() {
        _errorMessage = 'This field cannot be left blank!';
      });
    } else if (text.length < 4) {
      setState(() {
        _errorMessage = 'Text must be at least 4 characters!';
      });
    } else if (text.length > 16) {
      setState(() {
        _errorMessage = 'Text must be at most 16 characters!';
      });
    } else if (text == widget.initialValue) {
      context.pop();
    } else {
      widget.onSave(text);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Textfield
          TextField(
            controller: _controller,
            autofocus: true,
            maxLength: 16,
            decoration: InputDecoration(
              errorText: _errorMessage,
            ),
          ),
          const SizedBox(height: 20),

          // Save and Cancel buttons
          Row(
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () => context.pop(), child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _validateAndSave,
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
