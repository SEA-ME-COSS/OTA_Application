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
        height: parent.height * 0.1
        anchors.top: blank_map_main.bottom
    }

    Rectangle {
        id: map_detail
        width: parent.width * 0.6
        height: parent.height * 0.03
        anchors.top: blank_map1.bottom
        anchors.right: parent.right

        Image {
            source: "images/map_detail.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: map_main

        width: parent.width
        height: parent.width
        anchors.top: map_detail.bottom

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
            id: nightCanvas
            anchors.fill: parent
            dotColor: "#8B00FF"
            points: dataFetcher.night
        }

        DrawPath {
            id: accelCanvas
            anchors.fill: parent
            dotColor: "#FF0000"
            dotSize: 5
            points: dataFetcher.acceleration
        }

        DrawPath {
            id: decelCanvas
            anchors.fill: parent
            dotColor: "#FFFF00"
            dotSize: 5
            points: dataFetcher.deceleration
        }

        Connections {
            target: home

            onRedrawPath: {
                console.log("!!!!!!!!!!!?????????!!!!!!!!!!!")
                pathCanvas.requestPaint();
                nightCanvas.requestPaint();
                accelCanvas.requestPaint();
                decelCanvas.requestPaint();
            }
        }
    }
}
