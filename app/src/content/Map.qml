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

        Canvas {
            id: pathCanvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.fillStyle = "#008000";

                //console.log("!!!!!!!!!!!!!")
                //console.log(dataFetcher.locations.length)

                for (var i = 0; i < dataFetcher.locations.length; i++) {
                    var point = dataFetcher.locations[i];
                    var drawX = 210 + point.x * 1.5;
                    var drawY = 150 + point.y * 1.5;

                    ctx.beginPath();
                    ctx.arc(drawX, drawY, 3, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }
        }

        Canvas {
            id: accelCanvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.fillStyle = "#FF0000";

                //console.log("!!!!!!!!!!!!!")
                //console.log(dataFetcher.acceleration.length)

                for (var i = 0; i < dataFetcher.acceleration.length; i++) {
                    var point = dataFetcher.acceleration[i];
                    var drawX = 210 + point.x * 1.5;
                    var drawY = 150 + point.y * 1.5;

                    ctx.beginPath();
                    ctx.arc(drawX, drawY, 3, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }
        }

        Canvas {
            id: decelCanvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.fillStyle = "#FFFF00";

                //console.log("!!!!!!!!!!!!!")
                //console.log(dataFetcher.deceleration.length)

                for (var i = 0; i < dataFetcher.deceleration.length; i++) {
                    var point = dataFetcher.deceleration[i];
                    var drawX = 210 + point.x * 1.5;
                    var drawY = 150 + point.y * 1.5;

                    ctx.beginPath();
                    ctx.arc(drawX, drawY, 3, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }
        }
    }
}
