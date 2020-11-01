/// Provides the [BasicOptionsWidget] class.
import 'package:flutter/material.dart';

class BasicOptions {
  BasicOptions(this.name, this.description, this.imageUrl);

  final String name;
  final String description;
  final String imageUrl;
}

typedef BasicOptionsCallback = void Function(BasicOptions);

class BasicOptionsWidget extends StatefulWidget {
  const BasicOptionsWidget(this._options, this._callback) : super();

  final BasicOptions _options;
  final BasicOptionsCallback _callback;

  @override
  BasicOptionsWidgetState createState() =>
      BasicOptionsWidgetState(_options, _callback);
}

class BasicOptionsWidgetState extends State<BasicOptionsWidget> {
  BasicOptionsWidgetState(this._options, this._callback) : super();

  final BasicOptions _options;
  final BasicOptionsCallback _callback;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _options.name;
    _descriptionController.text = _options.description;
    _imageUrlController.text = _options.imageUrl;
    for (final TextEditingController controller in <TextEditingController>[
      _nameController,
      _descriptionController,
      _imageUrlController
    ]) {
      controller.selection =
          TextSelection(baseOffset: 0, extentOffset: controller.text.length);
    }
  }

  String validate(String value) {
    if (value.isEmpty) {
      return 'Values must not be empty.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Form form = Form(
      key: _key,
      child: ListView(
        children: <Widget>[
          TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: validate),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            validator: validate,
          ),
          TextFormField(
            controller: _imageUrlController,
            decoration: const InputDecoration(labelText: 'Image URL'),
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            if (_key.currentState.validate()) {
              Navigator.pop(context);
              _callback(BasicOptions(
                  _nameController.text,
                  _descriptionController.text,
                  _imageUrlController.text.isEmpty
                      ? null
                      : _imageUrlController.text));
            }
          },
        ),
        title: const Text('Options'),
      ),
      body: form,
    );
  }
}
