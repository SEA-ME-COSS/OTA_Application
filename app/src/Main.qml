import QtQuick
import "content"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello User!")

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

        property alias home: homeLoader.item
    }

    Loader {
        id: mapLoader
        source: "content/Map.qml"
        anchors.fill: parent
        visible: false

        property alias home: homeLoader.item
    }

    Loader {
        id: updateLoader
        source: "content/Update.qml"
        anchors.fill: parent
        visible: false
    }

    Loader {
        id: safetyDetailLoader
        source: "content/SafetyDetail.qml"
        anchors.fill: parent
        visible: false

        property alias home: homeLoader.item
    }

    Loader {
        id: typeDescriptionLoader
        source: "content/TypeDescription.qml"
        anchors.fill: parent
        visible: false
    }

    Timer {
        id: loading
        interval: 4500
        running: true
        repeat: false
        onTriggered: {
           splashScreenLoader.source = "content/Menu.qml"
           homeLoader.visible = true
           loading.running=false
       }
    }
}

