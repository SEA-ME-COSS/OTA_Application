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
        id: blank_map1
        width: parent.width
        height: parent.height * 0.13
        anchors.top: blank_map_main.bottom
    }

    Rectangle {
        id: map_main

        width: parent.width
        height: parent.width
        anchors.top: blank_map1.bottom

        Image {
            source: "images/map.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        DrawPath {
            id: pathCanvas
            anchors.fill: parent
            dotColor: "#008000"
            points: dataFetcher.locations
        }

        DrawPath {
            id: accelCanvas
            anchors.fill: parent
            dotColor: "#FF0000"
            points: dataFetcher.acceleration
        }

        DrawPath {
            id: decelCanvas
            anchors.fill: parent
            dotColor: "#FFFF00"
            points: dataFetcher.deceleration
        }

        Connections {
            target: home

            onRedrawPath: {
                console.log("!!!!!!!!!!!?????????!!!!!!!!!!!11")
                pathCanvas.requestPaint();
                accelCanvas.requestPaint();
                decelCanvas.requestPaint();
            }
        }
    }
}
