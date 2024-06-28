# About

<img width="15%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/e3c42ab0-3dad-43ce-bac4-af329a915d3f">

This is Connected Vehicle Application (Android). <br/>
It Provides users with basic information about the vehicle, such as battery, driving range and most recent driving directions.
In addition, the user's driving style is analyzed and provided based on safety, time, and fuel efficiency.

<div width="100%" align="center">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/2fb05859-fbec-487f-92be-3d4ae47b0cff">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/0b07e134-2d95-4a77-aed3-557e4de57b31">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/704d8872-f928-4216-a4ec-258073a9b6e1">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/08fcf89a-5ed5-4334-9c9f-66d90b989047">
</div>

<div width="100%" align="center">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/41e145e7-8e8d-4a33-8973-102c35ba7ace">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/c7e939a0-0a44-4a5b-8ed2-e4e9c1cffef5">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/30b01f4f-76e9-45dc-bda8-f57124d74e2a">
  <img width="24%" src="https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/b007abdc-e808-47c7-aa38-81502c9c8deb">
</div>

This application is also for the **OTA** part of the [Autonomous-Driving-System](https://github.com/SEA-ME-COSS/Autonomous-Driving-System) project. It was developed with QT6, Android SDK Tools and MQTT. 

![Architecture_OTA](https://github.com/Ho-mmd/ME_Digital-Trip-Book_App/assets/55338823/16594667-fad0-4db5-aac2-ee35ada8ec9d)

# Requirements

Recommend using Dockerfile in repository

- **Ubuntu 22.04**

- **QT packages**

- **Android SDK Tools**

- **MQTT**

# Usage

```bash
# Go to docker folder in repository
# Run docker container
docker compose up -d
docker exec -it docker-me_app /bin/bash # Enter Application Container
docker exec -it docker-me_server /bin/bash # Enter Server Container

# Install Qt6 and Android SDK Tools using apt or official website
```

# Reference
- [Qt for Android](https://doc.qt.io/qt-6/android.html)
- [Qt_Android_OpenSSL](https://doc.qt.io/qt-6/android-openssl-support.html)
- [Android SDK Tools](https://developer.android.com/studio?gad_source=1&gclid=CjwKCAjwvvmzBhA2EiwAtHVrbyTGOYFxq6wubKS6ATnsyjo7h8cbx2V6lQTiGtKWgab77aTh2p21mxoCgEEQAvD_BwE&gclsrc=aw.ds&hl=ko)
