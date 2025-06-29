import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Device Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Server configuration
  final String serverUrl = 'http://10.0.2.2:3000'; // Use 10.0.2.2 for Android emulator
  
  // Data variables
  List<Device> devices = [];
  bool isLoading = false;
  Timer? refreshTimer;
  
  @override
  void initState() {
    super.initState();
    loadDevices();
    // Auto-refresh every 10 seconds
    refreshTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      loadDevices();
    });
  }
  
  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }
  
  // Load devices from server
  Future<void> loadDevices() async {
    setState(() {
      isLoading = true;
    });
    
    try {
      final response = await http.get(
        Uri.parse('$serverUrl/api/devices'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> deviceList = data['devices'];
        
        setState(() {
          devices = deviceList.map((d) => Device.fromJson(d)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load devices');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorSnackBar('Error loading devices: $e');
    }
  }
  
  // Send command to device
  Future<void> sendCommand(String deviceId, String command) async {
    try {
      final response = await http.post(
        Uri.parse('$serverUrl/api/devices/$deviceId/command'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'command': command}),
      );
      
      if (response.statusCode == 200) {
        showSuccessSnackBar('Command sent successfully!');
        // Refresh devices after a short delay
        Future.delayed(Duration(seconds: 2), () {
          loadDevices();
        });
      } else {
        throw Exception('Failed to send command');
      }
    } catch (e) {
      showErrorSnackBar('Error sending command: $e');
    }
  }
  
  // Show success message
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
  
  // Show error message
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IoT Device Controller'),
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: loadDevices,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: isLoading && devices.isEmpty
            ? Center(child: CircularProgressIndicator())
            : devices.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.devices_other, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No devices found',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: loadDevices,
                          child: Text('Refresh'),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: loadDevices,
                    child: ListView.builder(
                      itemCount: devices.length,
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        return DeviceCard(
                          device: devices[index],
                          onCommand: sendCommand,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeviceDetailPage(
                                  device: devices[index],
                                  serverUrl: serverUrl,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadDevices,
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final Device device;
  final Function(String, String) onCommand;
  final VoidCallback onTap;
  
  DeviceCard({
    required this.device,
    required this.onCommand,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    bool isOnline = device.status == 'online';
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isOnline ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      device.deviceId,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Status: ${device.status}',
                style: TextStyle(
                  color: isOnline ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (device.lastSeen != null) ...[
                SizedBox(height: 4),
                Text(
                  'Last seen: ${formatDateTime(device.lastSeen!)}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: isOnline
                          ? () => onCommand(device.deviceId, 'led_on')
                          : null,
                      icon: Icon(Icons.lightbulb, size: 20),
                      label: Text('LED ON'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: isOnline
                          ? () => onCommand(device.deviceId, 'led_off')
                          : null,
                      icon: Icon(Icons.lightbulb_outline, size: 20),
                      label: Text('LED OFF'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String formatDateTime(String dateTime) {
    try {
      DateTime dt = DateTime.parse(dateTime);
      return '${dt.day}/${dt.month}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateTime;
    }
  }
}

class DeviceDetailPage extends StatefulWidget {
  final Device device;
  final String serverUrl;
  
  DeviceDetailPage({required this.device, required this.serverUrl});
  
  @override
  _DeviceDetailPageState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  List<S

