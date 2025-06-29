# 🚀 IoT Device Controller System

A complete IoT solution for controlling ESP32 devices remotely through a Flutter mobile app with real-time MQTT communication and a Node.js backend server.

## 📋 Table of Contents

- [🏗️ System Architecture](#️-system-architecture)
- [✨ Features](#-features)
- [🛠️ Tech Stack](#️-tech-stack)
- [📁 Project Structure](#-project-structure)
- [🚀 Quick Start](#-quick-start)
- [📱 Mobile App](#-mobile-app)
- [🖥️ Backend Server](#️-backend-server)
- [🔌 ESP32 Firmware](#-esp32-firmware)
- [🌐 API Documentation](#-api-documentation)
- [📊 Database Schema](#-database-schema)
- [🔧 Configuration](#-configuration)
- [🧪 Testing](#-testing)
- [📦 Deployment](#-deployment)
- [🔒 Security](#-security)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

## 🏗️ System Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Flutter App   │    │  Backend Server │    │   ESP32 Device  │
│                 │    │                 │    │                 │
│  • Device List  │    │  • REST APIs    │    │  • WiFi Module  │
│  • Controls     │◄──►│  • MQTT Broker  │◄──►│  • Sensors      │
│  • Real-time    │    │  • Database     │    │  • Actuators    │
│    Updates      │    │  • OTA Updates  │    │  • OTA Support  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
        │                        │                        │
        │                        │                        │
        ▼                        ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   HTTP/HTTPS    │    │    SQLite DB    │    │   MQTT Topics   │
│   REST API      │    │                 │    │                 │
│                 │    │  • devices      │    │  • status       │
│  • GET/POST     │    │  • sensor_data  │    │  • commands     │
│  • JSON Data    │    │  • commands     │    │  • sensor_data  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Communication Flow

1. **Device Registration**: ESP32 connects to WiFi and publishes status to MQTT
2. **Real-time Monitoring**: Backend subscribes to MQTT topics and stores data
3. **Mobile Control**: Flutter app sends HTTP requests to backend
4. **Command Execution**: Backend publishes commands via MQTT to ESP32
5. **Data Sync**: Real-time sensor data flows through MQTT to backend to mobile app

## ✨ Features

### 📱 Mobile App Features
- **Device Management**: View all connected IoT devices
- **Real-time Control**: Turn LED on/off with instant feedback
- **Live Monitoring**: Real-time sensor data visualization
- **Device Status**: Online/offline indicators with last seen timestamps
- **Pull-to-Refresh**: Manual data refresh capability
- **Responsive UI**: Material Design with smooth animations
- **Error Handling**: User-friendly error messages and retry mechanisms

### 🖥️ Backend Features
- **RESTful APIs**: Complete CRUD operations for devices and data
- **MQTT Integration**: Real-time communication with IoT devices
- **Data Storage**: SQLite database for persistent data storage
- **OTA Updates**: Over-the-air firmware update capability
- **Device Discovery**: Automatic device registration and status tracking
- **API Documentation**: Well-documented endpoints with examples
- **Health Monitoring**: System health checks and status endpoints

### 🔌 ESP32 Features
- **WiFi Connectivity**: Automatic connection and reconnection
- **MQTT Communication**: Bidirectional messaging with backend
- **Sensor Reading**: Analog sensor data collection
- **LED Control**: Remote LED control via MQTT commands
- **OTA Support**: Wireless firmware updates
- **Status Reporting**: Periodic heartbeat and status messages
- **Error Recovery**: Automatic reconnection on network failures

## 🛠️ Tech Stack

### Frontend (Mobile App)
- **Flutter 3.0+**: Cross-platform mobile development
- **Dart**: Programming language
- **HTTP Package**: REST API communication
- **Material Design**: UI/UX framework

### Backend (Server)
- **Node.js 16+**: JavaScript runtime
- **Express.js**: Web application framework
- **MQTT.js**: MQTT client library
- **SQLite3**: Embedded database
- **Multer**: File upload handling
- **CORS**: Cross-origin resource sharing

### Hardware (IoT Device)
- **ESP32**: Microcontroller with WiFi
- **Arduino IDE**: Development environment
- **PubSubClient**: MQTT library for Arduino
- **ArduinoJson**: JSON parsing library
- **WiFi Library**: Network connectivity

### Infrastructure
- **MQTT Broker**: HiveMQ (free tier) or local Mosquitto
- **SQLite**: Lightweight database
- **HTTP/HTTPS**: REST API communication
- **JSON**: Data interchange format

## 📁 Project Structure

```
iot-controller-system/
├── 📱 mobile-app/
│   ├── lib/
│   │   └── main.dart              # Flutter app main file
│   ├── pubspec.yaml               # Flutter dependencies
│   ├── android/                   # Android-specific files
│   └── ios/                       # iOS-specific files
├── 🖥️ backend-server/
│   ├── server.js                  # Main server file
│   ├── package.json               # Node.js dependencies
│   ├── uploads/                   # OTA firmware files
│   └── iot_database.db           # SQLite database file
├── 🔌 esp32-firmware/
│   └── esp32_iot_device.ino      # Arduino firmware code
├── 📚 docs/
│   ├── api-documentation.md       # API reference
│   ├── setup-guide.md            # Setup instructions
│   └── troubleshooting.md        # Common issues
└── 📄 README.md                  # This file
```

## 🚀 Quick Start

### Prerequisites
- **Flutter SDK** 3.0+ ([Install Guide](https://flutter.dev/docs/get-started/install))
- **Node.js** 16+ ([Download](https://nodejs.org/))
- **Arduino IDE** ([Download](https://www.arduino.cc/en/software))
- **ESP32 Development Board**
- **Android Studio** or **VS Code**

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/iot-controller-system.git
cd iot-controller-system
```

### 2. Setup Backend Server
```bash
cd backend-server
npm install
node server.js
```
Server will start on `http://localhost:3000`

### 3. Setup Mobile App
```bash
cd mobile-app
flutter pub get
flutter run
```

### 4. Setup ESP32 Firmware
1. Open `esp32-firmware/esp32_iot_device.ino` in Arduino IDE
2. Install required libraries:
   - PubSubClient
   - ArduinoJson
3. Update WiFi credentials in the code
4. Upload to ESP32 device

### 5. Test the System
1. Power on ESP32 device
2. Check backend server logs for device connection
3. Open mobile app to see connected devices
4. Test LED control from mobile app

## 📱 Mobile App

### Features Overview
The Flutter mobile app provides an intuitive interface for IoT device management:

- **Device Dashboard**: Lists all connected devices with status indicators
- **Device Controls**: Individual device control interface
- **Real-time Updates**: Live sensor data and status updates
- **Material Design**: Modern, responsive UI following Google's design guidelines

### Key Screens

#### 1. Home Screen
- Displays all registered IoT devices
- Shows online/offline status with color indicators
- Quick control buttons for immediate actions
- Pull-to-refresh functionality
- Auto-refresh every 10 seconds

#### 2. Device Detail Screen
- Comprehensive device information
- Real-time sensor data visualization
- Multiple control options (LED on/off, status check)
- Command history and execution status
- Device health metrics

### Configuration
Update the server URL in `lib/main.dart`:

```dart
final String serverUrl = 'http://YOUR_SERVER_IP:3000';
```

For Android emulator: `http://10.0.2.2:3000`
For physical devices: Use your computer's actual IP address

### Building
```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# iOS build (macOS only)
flutter build ios --release
```

## 🖥️ Backend Server

### Architecture Overview
The Node.js backend serves as the central hub for the IoT system:

- **REST API Server**: Handles HTTP requests from mobile app
- **MQTT Client**: Communicates with IoT devices in real-time  
- **Database Manager**: Stores device data and sensor readings
- **OTA Server**: Manages firmware updates

### Key Components

#### 1. REST API Endpoints
- `GET /api/devices` - List all devices
- `GET /api/devices/:id` - Get specific device
- `POST /api/devices/:id/command` - Send command to device
- `GET /api/devices/:id/sensor-data` - Get sensor data
- `POST /api/firmware/upload` - Upload firmware for OTA

#### 2. MQTT Integration
- Subscribes to device status and sensor topics
- Publishes commands to device command topics
- Handles device discovery and registration
- Manages real-time data flow

#### 3. Database Schema
```sql
-- Devices table
CREATE TABLE devices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    device_id TEXT UNIQUE,
    name TEXT,
    status TEXT DEFAULT 'offline',
    last_seen DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Sensor data table  
CREATE TABLE sensor_data (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    device_id TEXT,
    sensor_value INTEGER,
    voltage REAL,
    led_state BOOLEAN,
    wifi_strength INTEGER,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Commands table
CREATE TABLE commands (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    device_id TEXT,
    command TEXT,
    parameters TEXT,
    status TEXT DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

### Environment Configuration
Create a `.env` file for production settings:

```env
PORT=3000
MQTT_BROKER=mqtt://broker.hivemq.com:1883
MQTT_USERNAME=your_username
MQTT_PASSWORD=your_password
DB_PATH=./iot_database.db
```

### Running in Production
```bash
# Install PM2 for production
npm install -g pm2

# Start server with PM2
pm2 start server.js --name "iot-backend"

# Monitor logs
pm2 logs iot-backend
```

## 🔌 ESP32 Firmware

### Hardware Requirements
- **ESP32 Development Board** (ESP32-WROOM-32 recommended)
- **LED** connected to GPIO 2 (built-in LED)
- **Analog Sensor** connected to A0 (optional)
- **Push Button** connected to GPIO 0 (optional)

### Key Features

#### 1. WiFi Management
- Automatic connection to configured network
- Connection status monitoring
- Automatic reconnection on network loss
- WiFi signal strength reporting

#### 2. MQTT Communication
- Connects to configurable MQTT broker
- Publishes sensor data every 10 seconds
- Publishes heartbeat every 30 seconds
- Subscribes to command topic for remote control
- JSON message format for structured data

#### 3. Sensor Data Collection
- Reads analog sensor values (0-4095 range)
- Converts to voltage (0-3.3V)
- Reports WiFi signal strength
- Monitors device uptime and free memory

#### 4. Remote Control
- LED on/off control via MQTT commands
- Manual button control with MQTT notification
- Status reporting on command execution
- Error handling and status feedback

#### 5. OTA Updates
- Over-the-air firmware update capability
- HTTP-based firmware download
- Automatic reboot after successful update
- Update status reporting via MQTT

### Configuration
Update these settings in the firmware code:

```cpp
// WiFi credentials
const char* ssid = "YOUR_WIFI_NAME";
const char* password = "YOUR_WIFI_PASSWORD";

// MQTT broker settings
const char* mqtt_server = "broker.hivemq.com";
const int mqtt_port = 1883;
```

### MQTT Topics Structure
```
iot/[DEVICE_ID]/status    - Device status and heartbeat
iot/[DEVICE_ID]/sensor    - Sensor data updates  
iot/[DEVICE_ID]/command   - Commands from server
```

### Installation Steps
1. Install ESP32 board package in Arduino IDE
2. Install required libraries (PubSubClient, ArduinoJson)
3. Update configuration settings
4. Select correct board and port
5. Upload firmware to ESP32

## 🌐 API Documentation

### Base URL
```
http://localhost:3000/api
```

### Authentication
Currently no authentication required. For production, implement JWT or API key authentication.

### Endpoints

#### Get All Devices
```http
GET /api/devices
```

**Response:**
```json
{
  "devices": [
    {
      "id": 1,
      "device_id": "esp32_device_001",
      "name": null,
      "status": "online",
      "last_seen": "2024-01-15T10:30:00.000Z",
      "created_at": "2024-01-15T09:00:00.000Z"
    }
  ]
}
```

#### Get Device Details
```http
GET /api/devices/:deviceId
```

**Response:**
```json
{
  "device": {
    "id": 1,
    "device_id": "esp32_device_001",
    "status": "online",
    "last_seen": "2024-01-15T10:30:00.000Z"
  }
}
```

#### Send Command to Device
```http
POST /api/devices/:deviceId/command
Content-Type: application/json

{
  "command": "led_on",
  "parameters": {}
}
```

**Response:**
```json
{
  "success": true,
  "command_id": 123,
  "message": "Command sent successfully"
}
```

#### Get Sensor Data
```http
GET /api/devices/:deviceId/sensor-data?limit=50
```

**Response:**
```json
{
  "sensor_data": [
    {
      "id": 1,
      "device_id": "esp32_device_001",
      "sensor_value": 2048,
      "voltage": 1.65,
      "led_state": true,
      "wifi_strength": -45,
      "timestamp": "2024-01-15T10:30:00.000Z"
    }
  ]
}
```

#### Upload Firmware
```http
POST /api/firmware/upload
Content-Type: multipart/form-data

Form data:
firmware: [binary file]
```

#### Trigger OTA Update
```http
POST /api/devices/:deviceId/ota-update
Content-Type: application/json

{
  "firmware_url": "http://server.com/firmware.bin"
}
```

### Error Responses
```json
{
  "error": "Error message description",
  "code": "ERROR_CODE",
  "timestamp": "2024-01-15T10:30:00.000Z"
}
```

Common HTTP status codes:
- `200` - Success
- `400` - Bad Request
- `404` - Not Found
- `500` - Internal Server Error

## 📊 Database Schema

### Tables Overview

#### devices
Stores information about registered IoT devices.

| Column | Type | Description |
|--------|------|-------------|
| id | INTEGER | Primary key, auto-increment |
| device_id | TEXT | Unique device identifier |
| name | TEXT | Human-readable device name |
| status | TEXT | Current status (online/offline) |
| last_seen | DATETIME | Last communication timestamp |
| created_at | DATETIME | Device registration timestamp |

#### sensor_data
Stores sensor readings from IoT devices.

| Column | Type | Description |
|--------|------|-------------|
| id | INTEGER | Primary key, auto-increment |
| device_id | TEXT | Reference to devices table |
| sensor_value | INTEGER | Raw sensor reading (0-4095) |
| voltage | REAL | Converted voltage value |
| led_state | BOOLEAN | LED on/off state |
| wifi_strength | INTEGER | WiFi signal strength (dBm) |
| timestamp | DATETIME | Reading timestamp |

#### commands
Tracks commands sent to IoT devices.

| Column | Type | Description |
|--------|------|-------------|
| id | INTEGER | Primary key, auto-increment |
| device_id | TEXT | Target device identifier |
| command | TEXT | Command name |
| parameters | TEXT | JSON parameters |
| status | TEXT | Execution status |
| created_at | DATETIME | Command creation time |
| executed_at | DATETIME | Command execution time |

### Data Relationships
- `sensor_data.device_id` → `devices.device_id`
- `commands.device_id` → `devices.device_id`

### Indexes
```sql
CREATE INDEX idx_device_id ON sensor_data(device_id);
CREATE INDEX idx_timestamp ON sensor_data(timestamp);
CREATE INDEX idx_device_status ON devices(status);
```

## 🔧 Configuration

### Mobile App Configuration

#### Server Connection
Update `lib/main.dart`:
```dart
final String serverUrl = 'http://YOUR_SERVER_IP:3000';
```

#### Network Security (Android)
Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
<application android:usesCleartextTraffic="true">
```

### Backend Server Configuration

#### Environment Variables
Create `.env` file:
```env
PORT=3000
MQTT_BROKER=mqtt://broker.hivemq.com:1883
MQTT_USERNAME=username
MQTT_PASSWORD=password
DB_PATH=./iot_database.db
UPLOAD_DIR=./uploads
```

#### MQTT Broker Options
```javascript
// Free public brokers for testing
const brokers = [
  'mqtt://broker.hivemq.com:1883',
  'mqtt://test.mosquitto.org:1883',
  'mqtt://broker.emqx.io:1883'
];

// Local broker (recommended for production)
// Install: sudo apt-get install mosquitto
const localBroker = 'mqtt://localhost:1883';
```

### ESP32 Configuration

#### WiFi Settings
```cpp
const char* ssid = "YOUR_WIFI_SSID";
const char* password = "YOUR_WIFI_PASSWORD";
```

#### MQTT Settings
```cpp
const char* mqtt_server = "broker.hivemq.com";
const int mqtt_port = 1883;
const char* device_id = "esp32_device_001"; // Make unique per device
```

#### Hardware Pins
```cpp
#define LED_PIN 2          // Built-in LED
#define BUTTON_PIN 0       // Boot button
#define SENSOR_PIN A0      // Analog sensor input
```

## 🧪 Testing

### Unit Testing

#### Flutter App Tests
```bash
cd mobile-app
flutter test
```

Create `test/widget_test.dart`:
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:iot_controller_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('IoT Device Controller'), findsOneWidget);
  });
}
```

#### Backend API Tests
```bash
cd backend-server
npm install --save-dev mocha chai supertest
npm test
```

Create `test/api.test.js`:
```javascript
const request = require('supertest');
const app = require('../server');

describe('API Tests', () => {
  it('should get devices list', (done) => {
    request(app)
      .get('/api/devices')
      .expect(200)
      .end(done);
  });
});
```

### Integration Testing

#### End-to-End Testing
1. Start backend server
2. Power on ESP32 device
3. Run mobile app
4. Test complete workflow:
   - Device appears in app
   - Send LED on command
   - Verify LED turns on
   - Check sensor data updates

#### MQTT Testing
Use MQTT client to test device communication:
```bash
# Subscribe to all topics
mosquitto_sub -h broker.hivemq.com -t "iot/+/+"

# Send test command
mosquitto_pub -h broker.hivemq.com -t "iot/esp32_device_001/command" -m '{"command":"led_on"}'
```

### Performance Testing

#### Load Testing Backend
```bash
# Install Apache Bench
apt-get install apache2-utils

# Test API performance
ab -n 1000 -c 10 http://localhost:3000/api/devices
```

#### Memory Testing ESP32
Monitor ESP32 memory usage:
```cpp
Serial.print("Free heap: ");
Serial.println(ESP.getFreeHeap());
```

## 📦 Deployment

### Mobile App Deployment

#### Android APK
```bash
# Build release APK
flutter build apk --release

# Build App Bundle for Play Store
flutter build appbundle --release
```

#### iOS App Store
```bash
# Build for iOS
flutter build ios --release

# Archive in Xcode
open ios/Runner.xcworkspace
# Product → Archive → Upload to App Store
```

### Backend Server Deployment

#### Using PM2 (Recommended)
```bash
# Install PM2
npm install -g pm2

# Start application
pm2 start server.js --name iot-backend

# Save PM2 configuration
pm2 save
pm2 startup
```

#### Using Docker
Create `Dockerfile`:
```dockerfile
FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

Build and run:
```bash
docker build -t iot-backend .
docker run -p 3000:3000 iot-backend
```

#### Cloud Deployment Options
- **Heroku**: Easy deployment with git push
- **AWS EC2**: Full control, scalable
- **Google Cloud Run**: Serverless container deployment  
- **DigitalOcean**: Simple VPS hosting

### MQTT Broker Deployment

#### Local Mosquitto Broker
```bash
# Install Mosquitto
sudo apt-get install mosquitto mosquitto-clients

# Start broker
sudo systemctl start mosquitto
sudo systemctl enable mosquitto

# Configure authentication (optional)
sudo mosquitto_passwd -c /etc/mosquitto/passwd username
```

#### Cloud MQTT Services
- **HiveMQ Cloud**: Free tier available
- **AWS IoT Core**: Enterprise-grade MQTT
- **Google Cloud IoT**: Managed IoT platform
- **Azure IoT Hub**: Microsoft's IoT solution

### ESP32 OTA Deployment

#### Firmware Update Process
1. Build new firmware binary
2. Upload to web server
3. Send OTA command via MQTT
4. ESP32 downloads and installs update
5. Device reboots with new firmware

#### Batch OTA Updates
```javascript
// Send OTA command to all devices
const devices = await db.all('SELECT device_id FROM devices WHERE status = "online"');
devices.forEach(device => {
  const topic = `iot/${device.device_id}/command`;
  const command = {
    command: 'ota_update',
    url: 'http://server.com/firmware.bin'
  };
  mqttClient.publish(topic, JSON.stringify(command));
});
```

## 🔒 Security

### Current Security Status
⚠️ **This is a development/educational project with basic security measures. For production use, implement additional security features.**

### Recommended Security Enhancements

#### 1. Authentication & Authorization
```javascript
// Add JWT authentication
const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');
  if (!token) return res.status(401).json({ error: 'Access denied' });
  
  try {
    const verified = jwt.verify(token, process.env.JWT_SECRET);
    req.user = verified;
    next();
  } catch (error) {
    res.status(400).json({ error: 'Invalid token' });
  }
};
```

#### 2. MQTT Security
```cpp
// Use TLS/SSL for MQTT
const char* mqtt_server = "secure-broker.com";
const int mqtt_port = 8883; // Secure port

// Add client certificates
WiFiClientSecure espClient;
espClient.setCACert(ca_cert);
espClient.setCertificate(client_cert);
espClient.setPrivateKey(client_key);
```

#### 3. API Security
```javascript
// Rate limiting
const rateLimit = require('express-rate-limit');
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});
app.use('/api/', limiter);

// Input validation
const { body, validationResult } = require('express-validator');
app.post('/api/devices/:id/command',
  body('command').isLength({ min: 1 }).trim().escape(),
  (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    // Handle request
  }
);
```

#### 4. Device Security
```cpp
// Device authentication token
const char* device_token = "your-secure-device-token";

// Include token in MQTT messages
doc["device_token"] = device_token;
```

### Security Checklist
- [ ] Implement user authentication
- [ ] Use HTTPS for all API communications
- [ ] Secure MQTT with TLS/SSL
- [ ] Validate and sanitize all inputs
- [ ] Implement rate limiting
- [ ] Use device certificates for authentication
- [ ] Encrypt sensitive data at rest
- [ ] Regular security audits
- [ ] Keep all dependencies updated
- [ ] Implement proper error handling (don't expose internal details)

## 🤝 Contributing

We welcome contributions to improve this IoT system! Please follow these guidelines:

### Getting Started
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test thoroughly
5. Commit your changes: `git commit -m 'Add amazing feature'`
6. Push to the branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

### Code Style Guidelines

#### Flutter/Dart
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter format` before committing
- Add documentation for public APIs

#### Node.js/JavaScript
- Use ES6+ features
- Follow [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
- Use meaningful variable names
- Add JSDoc comments for functions

#### Arduino/C++
- Follow [Arduino Style Guide](https://www.arduino.cc/en/Reference/StyleGuide)
- Use consistent indentation (2 spaces)
- Comment complex logic
- Use descriptive function names

### Testing Requirements
- Add unit tests for new features
- Ensure all existing tests pass
- Test on multiple devices/platforms
- Update documentation

### Bug Reports
Please include:
- System specifications
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if applicable

### Feature Requests
- Describe the use case
- Explain the expected behavior
- Consider backward compatibility
- Discuss implementation approach

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 IoT Controller System

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🆘 Support & Contact

- **Documentation**: Check the `/docs` folder for detailed guides
- **Issues**: Report bugs on [GitHub Issues](https://github.com/yourusername/iot-controller-system/issues)
- **Discussions**: Join conversations in [GitHub Discussions](https://github.com/yourusername/iot-controller-system/discussions)
- **Email**: raghavrajk24@gmail.com

## 🎯 Roadmap

### Version 2.0 (Planned)
- [ ] User authentication and multi-tenancy
- [ ] Advanced data visualization and analytics
- [ ] Support for multiple device types
- [ ] Cloud deployment templates
- [ ] WebSocket support for real-time updates
- [ ] Device grouping and batch operations
- [ ] Historical data export
- [ ] Mobile app push notifications

### Version 3.0 (Future)
- [ ] Machine learning integration
- [ ] Voice control support
- [ ] Advanced security features
- [ ] Kubernetes deployment support
- [ ] GraphQL API
- [ ] Progressive Web App (PWA)

---

**⭐ Star this repository if you find it helpful!**

Made with ❤️ for the IoT community
