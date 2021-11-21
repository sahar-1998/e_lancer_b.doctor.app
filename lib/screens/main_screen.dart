import 'package:b_doctor_app/helpers/helpers.dart';
import 'package:b_doctor_app/providers/contact_provider.dart';
import 'package:b_doctor_app/screens/contact_screen.dart';
import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Helpers {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ContactProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor1,
        toolbarHeight: 65,
        title: const Text('Reservation List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                // Navigator.pushNamed(context, '/create_contact_screen'),
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (BuildContext context, ContactProvider value, child) {
          if (value.contacts.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: value.contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactScreen(
                          contact: value.contacts[index],
                          title: 'Update',
                        ),
                      ),
                    );
                  },
                  leading:
                      const Icon(Icons.contact_mail_sharp, color: mainColor1),
                  title: Text(
                    value.contacts[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        letterSpacing: 1),
                  ),
                  subtitle: Text(value.contacts[index].date),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: kadd2),
                    onPressed: () async =>
                        await delete(value.contacts[index].id),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 22.sp,
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> delete(int id) async {
    bool deleted =
        await Provider.of<ContactProvider>(context, listen: false).delete(id);
    String message = deleted ? 'Deleted successfully' : 'Delete failed';
    showSnackBar(context: context, message: message, error: !deleted);
  }
}
