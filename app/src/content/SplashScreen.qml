import QtQuick 2.15

Item {
    id: splashScreen

    width: parent.width
    height: parent.height
    anchors.fill: parent

    Rectangle {
        id: mainLogo
        anchors.centerIn: parent
        width: parent.width
        height: parent.height * 0.3

        Image {
            source: "images/logo1.png"
            anchors.centerIn: parent
            width: sourceSize.width * 0.5
            height: sourceSize.height * 0.5
        }
    }

    Rectangle {
        anchors.top: mainLogo.bottom
        width: parent.width
        height: parent.height * 0.2

        Image {
            source: "images/logo2.png"
            anchors.centerIn: parent
            width: sourceSize.width * 0.3
            height: sourceSize.height * 0.3
        }
    }
}
