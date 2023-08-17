import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:shoppreal/widgets/widgets.dart';



class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
  static const String routeName = '/user';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const UserScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "WALKSHOE"),
        bottomNavigationBar: const Cstmappbar(currentPageRoute: routeName,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/profile/man.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Susin ps',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'susin@gmail.com',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Orders',
                    style: GoogleFonts.abrilFatface(color: Colors.white70),
                  ),
                ),
              ),
               const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Return Or Replace',
                    style: GoogleFonts.abrilFatface(color: Colors.white70),
                  ),
                ),
              ),
               const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Need Help Contact Coustomer Care ',
                    style: GoogleFonts.abrilFatface(color: Colors.white70),
                  ),
                ),
              ),
               const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.abrilFatface(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        );
  }
}
