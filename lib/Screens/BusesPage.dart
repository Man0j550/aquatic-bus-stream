import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../seating/Seatingtype.dart';
import '../model/bus.dart';

class BusesPage extends StatelessWidget {
  final List<Buses> buses = [
    Buses(name: "Rjy", no: "10", des: 'hyd', date: '2022-03-21', time: '09:00 AM'),
    Buses(name: "Tpg", no: "10", des: 'vizag', date: '2022-03-22', time: '10:30 AM'),
    Buses(name: "Tanuku", no: "10", des: 'Rjy', date: '2022-03-23', time: '11:45 AM'),
    Buses(name: "Hyb", no: "10", des: 'bangaloru', date: '2022-03-24', time: '01:15 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              FontAwesomeIcons.bus,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Aquatic Stream Bus',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: const IconThemeData(color: Colors.white), 
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blueGrey[900],
        child: ListView.builder(
          itemCount: buses.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectSeatTypePage()),
                );
              },
              child: Card(
                margin: EdgeInsets.only(bottom: 19),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.blueGrey[800],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      leading: Icon(
                        Icons.directions_bus_filled,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        'Bus ${buses[index].no}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${buses[index].name} --> ${buses[index].des}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            'Date: ${buses[index].date}',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Time: ${buses[index].time}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

