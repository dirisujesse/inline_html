import 'package:flutter/material.dart';
import 'package:inline_html/inline_html.dart';

class InlineImageForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> formState;
  final TextEditingController controller;
  final VoidCallback? onSubmit;

  const InlineImageForm({
    required this.formKey,
    required this.formState,
    required this.controller,
    this.onSubmit,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _InlineImageFormState();
  }
}

class _InlineImageFormState extends State<InlineImageForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Image URL'),
              controller: widget.controller,
              validator: AppValidators.urlValidator,
              key: Key("inline_image_form_input"),
            ),
          ),
          BoolListener(
            valueListenable: widget.formState,
            builder: (isValid) {
              return ElevatedButton(
                onPressed: isValid ? widget.onSubmit : null,
                key: Key("inline_image_form_btn"),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Icon(Icons.arrow_forward),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
