import 'package:b_doctor_app/database/date_and_time.dart';
import 'package:b_doctor_app/helpers/helpers.dart';
import 'package:b_doctor_app/models/contact.dart';
import 'package:b_doctor_app/providers/contact_provider.dart';
import 'package:b_doctor_app/widgets/app_text_field.dart';
import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key, this.title = 'Create', this.contact})
      : super(key: key);

  final String title;
  final Contact? contact;

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _numberTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController =
        TextEditingController(text: widget.contact?.name ?? '');
    _numberTextController =
        TextEditingController(text: widget.contact?.age ?? '');
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
        backgroundColor: Colors.transparent,
        toolbarHeight: 260.h,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset('assets/h.png'),
          padding: const EdgeInsets.only(bottom: 20, top: 20, left: 0, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Text(
          AppLocalizations.of(context)!.fillthisinformation,
            style: TextStyle(
              fontFamily: 'Pacifico',
              wordSpacing: 3,
              fontSize: 24.sp,
              color: kadd2,
            ),
          ),
           SizedBox(height: 15.h),
          AppTextField(
            textEditingController: _nameTextController,
            hint: AppLocalizations.of(context)!.name,
            prefixIcon: Icons.person,
            color: mainColor1,
          ),
           SizedBox(height: 10.h),
          AppTextField(
            textEditingController: _numberTextController,
            hint: AppLocalizations.of(context)!.age,
            prefixIcon: Icons.tag_faces,
            color: mainColor1,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 0, top: 10),
            child: DateAndTime(),
          ),
           SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () async => await performCreate(),
            child:  Text(AppLocalizations.of(context)!.save,),
            style: ElevatedButton.styleFrom(
              primary: kadd2,
              minimumSize: const Size(0, 50),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/main_screen');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: mainColor1,
                ),
                Text(
                    AppLocalizations.of(context)!.reservatinlist,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: mainColor1,
                      fontFamily: 'Pacifico',
                      letterSpacing: 1),
                ),
              ],
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
    bool status = widget.contact == null
        ? await Provider.of<ContactProvider>(context, listen: false)
            .create(contact)
        : await Provider.of<ContactProvider>(context, listen: false)
            .update(contact);
    if (status) clear();
    String message = status ? 'Reservation Done' : 'Failed to save';
    showSnackBar(context: context, message: message, error: !status);
  }

  Contact get contact {
    Contact c = widget.contact != null ? widget.contact! : Contact();
    c.name = _nameTextController.text;
    c.age = _numberTextController.text;
    c.time =
        "${Provider.of<TimeProvider>(context, listen: false).time.hour}: ${Provider.of<TimeProvider>(context, listen: false).time.minute}";
    c.date =
        '${Provider.of<TimeProvider>(context, listen: false).dateTime.year} , ${Provider.of<TimeProvider>(context, listen: false).dateTime.month} , ${Provider.of<TimeProvider>(context, listen: false).dateTime.day}';
    return c;
  }

  void clear() {
    _nameTextController.text = '';
    _numberTextController.text = '';
  }
}
