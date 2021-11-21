import 'package:b_doctor_app/database/date_and_time.dart';
import 'package:b_doctor_app/helpers/helpers.dart';
import 'package:b_doctor_app/models/contact.dart';
import 'package:b_doctor_app/providers/contact_provider.dart';
import 'package:b_doctor_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  _CreateContactScreenState createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen>
    with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _numberTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _numberTextController = TextEditingController();
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
        title:  Text('Create Contact'),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
           Text(
            'Enter new contact details',
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
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: DateAndTime(),
          ),
           SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () async => await performCreate(),
            child: const Text('SAVE'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 50),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performCreate() async {
    if (checkData()) {
      await create();
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

  Future<void> create() async {
    bool created = await Provider.of<ContactProvider>(context, listen: false)
        .create(contact);
    if (created) clear();
    String message = created ? 'Created successfully' : 'Create failed';
    showSnackBar(context: context, message: message, error: !created);
  }

  Contact get contact {
    Contact c = Contact();
    c.name = _nameTextController.text;
    c.age = _numberTextController.text;
    return c;
  }

  void clear() {
    _nameTextController.text = '';
    _numberTextController.text = '';
  }
}
