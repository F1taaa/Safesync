import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickCallPage extends StatelessWidget {
  const QuickCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set app bar background color
        elevation: 0, // Remove app bar elevation
        title: const Text(
          'Quick Call',
          style: TextStyle(
            fontWeight: FontWeight.w400, 
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true, // Center app bar title
        // automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 14),
        itemCount: agencyNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide.none
                ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: Icon(
                  agencyNumbers[index].iconData,
                  size: 35,
                  color: agencyNumbers[index].color,
                ),
                title: Text(
                  agencyNumbers[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500, 
                  ),
                ),
                subtitle: Text(
                  agencyNumbers[index].phoneNumber,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.phone_fill,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AgencyNumber {
  final String name;
  final IconData iconData;
  final Color color;
  final String phoneNumber;

  AgencyNumber({
    required this.name,
    required this.iconData,
    required this.color,
    required this.phoneNumber,
  });
}

final List<AgencyNumber> agencyNumbers = [
  AgencyNumber(
    name: 'Police Station 1',
    iconData: Icons.local_police,
    color: Colors.blue,
    phoneNumber: '0344355001',
  ),
  AgencyNumber(
    name: 'Police Station 2',
    iconData: Icons.local_police,
    color: Colors.blue,
    phoneNumber: '0344348177',
  ),
  AgencyNumber(
    name: 'Police Station 3',
    iconData: Icons.local_police,
    color: Colors.blue,
    phoneNumber: '0344740209',
  ),
  AgencyNumber(
    name: 'Police Station 4',
    iconData: Icons.local_police,
    color: Colors.blue,
    phoneNumber: '09985987466',
  ),
  AgencyNumber(
    name: 'Bureau of Fire Department',
    iconData: Icons.fire_extinguisher,
    color: Colors.red,
    phoneNumber: '0344345021',
  ),
  AgencyNumber(
    name: 'Bacolod City Fire Station',
    iconData: Icons.fire_extinguisher,
    color: Colors.red,
    phoneNumber: '09234567890',
  ),
  AgencyNumber(
    name: 'Bacolod Medical Plaza',
    iconData: Icons.local_hospital,
    color: Colors.pink,
    phoneNumber: '0344582361',
  ),
  AgencyNumber(
    name: 'Riverside Medical Center, Inc.',
    iconData: Icons.local_hospital,
    color: Colors.pink,
    phoneNumber: '0347050000',
  ),
];
