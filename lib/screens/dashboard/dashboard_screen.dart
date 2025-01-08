
// import 'package:flutter/material.dart';
// import 'package:supbase_app/models/farm_model.dart';
// import '../../services/farm_service.dart';

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   final _farmService = FarmService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Farm Dashboard'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () async {
//               await _farmService.signOut();
//               Navigator.pushReplacementNamed(context, '/login');
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder<List<Farm>>(
//         stream: _farmService.getFarms(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           final farms = snapshot.data ?? [];
//           return farms.isEmpty
//               ? Center(child: Text('No farms added yet'))
//               : ListView.builder(
//                   itemCount: farms.length,
//                   itemBuilder: (context, index) {
//                     final farm = farms[index];
//                     return ListTile(
//                       title: Text(farm.name),
//                       subtitle: Text(farm.location),
//                       trailing: Text('${farm.size} acres'),
//                     );
//                   },
//                 );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add farm functionality
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// lib/screens/dashboard/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to AgriTech Dashboard!'),
      ),
    );
  }
}
