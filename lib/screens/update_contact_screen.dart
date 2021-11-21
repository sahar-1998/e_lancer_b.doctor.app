import 'package:b_doctor_app/helpers/helpers.dart';
import 'package:b_doctor_app/models/contact.dart';
import 'package:b_doctor_app/providers/contact_provider.dart';
import 'package:b_doctor_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateContactScreen extends StatefulWidget {
  const UpdateContactScreen({Key? key, required this.contact})
      : super(key: key);

  final Contact contact;

  @override
  _UpdateContactScreenState createState() => _UpdateContactScreenState();
}

class _UpdateContactScreenState extends State<UpdateContactScreen>
    with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _numberTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController(text: widget.contact.name);
    // _numberTextController = TextEditingController(text: widget.contact.phone);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _numberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
           Text(
            'Enter updated contact details',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
           SizedBox(height: 15.h),
          AppTextField(
            textEditingController: _nameTextController,
            hint: 'Name',
            prefixIcon: Icons.person,
          ),
           SizedBox(height: 10.h),
          AppTextField(
            textEditingController: _numberTextController,
            hint: 'Number',
            prefixIcon: Icons.phone_android,
          ),
           SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () async => await performUpdate(),
            child: const Text('SAVE'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 50),
            ),
          )
        ],
      ),
    );
  }

  Future<void> performUpdate() async {
    if (checkData()) {
      await update();
    }
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _numberTextController.text.isNotEmpty) {
      return true;
    }
    //SNACKBAR
    showSnackBar(
        context: context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> update() async {
    bool updated = await Provider.of<ContactProvider>(context, listen: false)
        .update(contact);
    String message = updated ? 'Updated successfully' : 'Update failed';
    showSnackBar(context: context, message: message, error: !updated);
    if (updated) Navigator.pop(context);
  }

  Contact get contact {
    // Contact c = Contact();
    // c.id = widget.contact.id;
    Contact c = widget.contact;
    c.name = _nameTextController.text;
    // c.phone = _numberTextController.text;
    return c;
  }
}
