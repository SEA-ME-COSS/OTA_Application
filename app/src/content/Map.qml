import QtQuick 2.15

Item {
    id: map

    width: parent.width
    height: parent.height * 0.87
    anchors.top: parent.top

    Rectangle {
        id: blank_map_main

        width: parent.width
        height: parent.height * 0.08
        anchors.top: parent.top

        Rectangle {
            width: parent.width * 0.12
            height: parent.height
            anchors.right: parent.right

            Image {
                source: "images/logo2.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Rectangle {
        id: map_main

        width: parent.width
        height: parent.height * 0.8
        anchors.top: blank_map_main.bottom

        Image {
            source: "images/map.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }
}
