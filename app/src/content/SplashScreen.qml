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
            id: fadeinLogo
            source: "images/logo1.png"
            anchors.centerIn: parent
            width: sourceSize.width * 0.5
            height: sourceSize.height * 0.5
            opacity: 0.0

            NumberAnimation {
                id: logo1FadeInAnimation
                target: fadeinLogo
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 700
                easing.type: Easing.InQuad
            }
        }
    }

    Rectangle {
        id: mainIcon
        y: parent.height / 2.5
        width: parent.width
        height: parent.height * 0.2

        Image {
            id: rotatingLogo
            source: "images/logo2.png"
            anchors.centerIn: parent
            width: sourceSize.width * 0.3
            height: sourceSize.height * 0.3
            transform: Rotation { id: rotation; origin.x: rotatingLogo.width / 2; origin.y: rotatingLogo.height / 2}

            NumberAnimation {
                id: rotationAnimation
                target: rotation
                property: "angle"
                from: 0
                to: 360
                duration: 1000
                loops: 2
                easing.type: Easing.Linear

                onStopped: {
                    positionAnimation.start()
                }
            }

            Component.onCompleted: {
                rotationAnimation.start()
            }
        }

        NumberAnimation {
            id: positionAnimation
            target: mainIcon
            property: "y"
            from: mainIcon.y
            to: mainIcon.y + mainLogo.height / 1.5
            duration: 800
            easing.type: Easing.OutQuad

            onStopped: {
                logo1FadeInAnimation.start()
            }
        }
    }
}
