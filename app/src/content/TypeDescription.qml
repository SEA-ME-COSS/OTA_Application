import QtQuick 2.15

Item {
    id: typedescription

    width: parent.width
    height: parent.height * 0.87
    anchors.top: parent.top

    Rectangle {
        id: blank_typedescript_main

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
        id: blank_typedescript
        width: parent.width
        height: parent.height * 0.05
        anchors.top: blank_typedescript_main.bottom
    }

    Rectangle {
        id: typedescript_main

        width: parent.width
        height: parent.height * 0.8
        anchors.top: blank_typedescript.bottom

        Image {
            source: "images/description_type.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
        }
    }
}
