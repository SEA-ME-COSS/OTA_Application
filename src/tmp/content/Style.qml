import QtQuick 2.15

Item {
    id: style

    width: parent.width
    height: parent.height * 0.87
    anchors.top: parent.top

    Rectangle {
        id: blank_style_main

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
        id: style_main

        width: parent.width
        height: parent.height * 0.65
        anchors.top: blank_style_main.bottom

        Image {
            source: "images/style_main.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        Text {
            text: "Efficiency"
            font.pointSize: 30
            font.weight: Font.Black

            x: 180
            y: 110
        }

        Text {
            text: "Fuel Efficiency"
            font.pointSize: 30
            font.weight: Font.Black

            x: 180
            y: 220
        }

        Text {
            text: "Safety"
            font.pointSize: 30
            font.weight: Font.Black

            x: 180
            y: 340
        }

    }

    Rectangle {
        id: style_comment

        width: parent.width
        height: parent.height * 0.2
        anchors.top: style_main.bottom

        Image {
            source: "images/style_comment.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        Text {
            text: "Comment"
            font.pointSize: 30
            font.weight: Font.Black

            x: 140
            y: 55
        }
    }
}
