import QtQuick 2.15

Item {
    id: update

    width: parent.width
    height: parent.height * 0.87
    anchors.top: parent.top

    Rectangle {
        id: blank_update_main

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
        id: blank_update1
        width: parent.width
        height: parent.height * 0.13
        anchors.top: blank_update_main.bottom
    }

    Rectangle {
        id: update_main

        width: parent.width
        height: parent.width
        anchors.top: blank_update1.bottom

        Image {
            id: update_bg
            source: "images/update_x.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop

            Image {
                id: update_run
                source: "images/update.png"
                visible: false

                width: 150
                height: 40
                x: 130
                y: 310

                MouseArea {
                   anchors.fill: parent
                   onClicked: {
                       console.log("ota")
                       ota.publishMessage()
                       dataFetcher.openingSignal = 0
                       dataFetcher.fetchData()
                   }
               }
            }
        }
    }

    Connections {
        target: ota
        function onNewUpdate() {
            update_bg.source = "images/update_o.png"
            update_run.visible = true
        }
    }
}
