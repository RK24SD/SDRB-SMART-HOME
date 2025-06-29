SDRB Smart Home Solution: ESP RainMaker Clone
Overview
We’re a passionate team of four, driven to empower SDRB’s smart home vision despite a tight one-day final sprint. Led by our technical lead, Raj k (Team - solvitor), with UI/UX, content, and documentation support, we built a functional prototype with a unique Smart Home Scene Activation feature, blending convenience and sustainability for modern households.

Project Description
This ESP RainMaker clone enables seamless control of ESP32-based smart home devices via a Flutter app, Node.js backend, and MQTT communication. Designed for busy professionals and accessibility-focused users, it includes device provisioning, control, energy insights, OTA updates, and our standout feature: one-tap or voice-activated scenes (e.g., "Movie Time" dims lights, turns on TV).

Repository Structure
firmware/: ESP32 code (ESP-IDF) for provisioning, MQTT, and OTA.

backend/: Node.js MQTT broker, REST APIs, Firebase integration.

app/: Flutter app for Android/iOS with UI assets.

docs/: Deployment guide, screenshots, innovation highlights.

demo_video.mp4: 5-min video showcasing functionality.

Setup Instructions
Firmware:

Install ESP-IDF v5.1.

Clone repo: git clone 

Navigate to firmware/, run idf.py build flash monitor.

Configure Wi-Fi credentials via app.

Backend:

Install Node.js v18, Firebase CLI.

Navigate to backend/, run npm install, then node src/index.js.

Set up Firebase project, add credentials in config/firebase.json.

App:

Install Flutter 3.22.

Navigate to app/, run flutter pub get, then flutter run.

Build APK: flutter build apk.

Dependencies:

Firmware: ESP-IDF libraries.

Backend: aedes, express, firebase-admin.

App: mqtt_client, speech_to_text, fl_chart, firebase_auth.

Architecture
Firmware: ESP32 uses ESP-IDF for MQTT communication and OTA updates.

Backend: Node.js with Aedes MQTT broker, Firebase for auth/database, REST APIs for OTA.

App: Flutter with Provider, integrating MQTT for control, speech_to_text for scenes, fl_chart for energy insights.

Data Flow: App → MQTT → ESP32; usage logs → Firebase → energy suggestions.

Features
Device Provisioning: Manual Wi-Fi setup for ESP32 devices.

Device Control: Real-time on/off, dimming via MQTT.

Energy Dashboard: Usage charts, rule-based schedule suggestions (15% energy savings, Statista 2024).

OTA Updates: Firmware updates via REST API.

Smart Home Scene Activation: One-tap/voice control of multiple devices (e.g., "Good Night" turns off lights, adjusts thermostat).

Unique Feature: Smart Home Scene Activation
Our standout feature lets users create and activate scenes (e.g., "Movie Time") to control multiple devices simultaneously via tap or voice ("Activate Good Night"). Stored in Firebase, scenes use MQTT for batch commands, enhancing convenience for 65% of users valuing automation (Statista 2024). Implemented with speech_to_text, it’s simple yet impactful, aligning with SDRB’s user-centric vision.

Deliverables
GitHub Repository:


Android APK: In docs/ or GDrive zip.

Deployment Guide: docs/deployment_guide.pdf (setup, flash, build).

Screenshots: docs/screenshots/ (login, control, scenes).

Innovation Highlights: docs/innovation.pdf (scene feature).

Challenges and Triumphs
With one technical lead and three non-technical members, we faced a steep challenge in the final day. Our UI/UX Designer crafted intuitive interfaces, our Content Creator produced a polished video, and our Documentation Support ensured clear guides, while coded tirelessly. The scene activation feature reflects our commitment to SDRB’s innovative smart home future.

Open-Source Credits
ESP-IDF: Firmware framework.

Aedes: MQTT broker.

Flutter: App framework.

speech_to_text: Voice control.

fl_chart: Energy dashboard charts.
