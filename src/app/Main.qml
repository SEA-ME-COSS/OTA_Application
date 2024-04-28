import QtQuick
import QtQuick.Controls
import "content"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Loader {
        id: splashScreenLoader
        source: "content/SplashScreen.qml"
        anchors.fill: parent
    }

    Loader {
        id: homeLoader
        source: "content/Home.qml"
        anchors.fill: parent
        visible: false
    }

    Loader {
        id: styleLoader
        source: "content/Style.qml"
        anchors.fill: parent
        visible: false
    }

    Loader {
        id: mapLoader
        source: "content/Map.qml"
        anchors.fill: parent
        visible: false
    }

    Timer {
       interval: 500
       running: true
       repeat: false
       onTriggered: {
           splashScreenLoader.source = "content/Menu.qml"
           homeLoader.visible = true
       }
    }
}
