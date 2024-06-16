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
            id: score_box
            source: "images/style_main.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: scoreSafety
            source: safety()

            width: 230
            height: 50

            x: 150
            y: 100

            MouseArea {
               anchors.fill: parent
               onClicked: {
                    styleLoader.visible = false
                    safetyDetailLoader.visible = true
               }
           }
        }

        Image {
            id: scoreFuel
            source: fuel()

            width: 230
            height: 50

            x: 150
            y: 215
        }

        Image {
            id: scoreTime
            source: time()

            width: 230
            height: 50

            x: 150
            y: 330
        }
    }

    Rectangle {
        id: style_comment

        width: parent.width
        height: parent.height * 0.2
        anchors.top: style_main.bottom

        Image {
            id: drivingType
            source: type()
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit

            MouseArea {
               anchors.fill: parent
               onClicked: {
                    styleLoader.visible = false
                    typeDescriptionLoader.visible = true
               }
           }
        }
    }

    function time() {
        if(dataFetcher.score_time < 7)
            scoreTime.source = "images/lv1.png"
        else if(dataFetcher.score_time < 14)
            scoreTime.source = "images/lv2.png"
        else if(dataFetcher.score_time < 21)
            scoreTime.source = "images/lv3.png"
        else if(dataFetcher.score_time < 28)
            scoreTime.source = "images/lv4.png"
        else if(dataFetcher.score_time < 35)
            scoreTime.source = "images/lv5.png"
        else if(dataFetcher.score_time < 42)
            scoreTime.source = "images/lv6.png"
        else if(dataFetcher.score_time < 49)
            scoreTime.source = "images/lv7.png"
        else if(dataFetcher.score_time < 56)
            scoreTime.source = "images/lv8.png"
        else if(dataFetcher.score_time < 63)
            scoreTime.source = "images/lv9.png"
        else if(dataFetcher.score_time < 70)
            scoreTime.source = "images/lv10.png"
        else if(dataFetcher.score_time < 76)
            scoreTime.source = "images/lv11.png"
        else if(dataFetcher.score_time < 82)
            scoreTime.source = "images/lv12.png"
        else if(dataFetcher.score_time < 88)
            scoreTime.source = "images/lv13.png"
        else if(dataFetcher.score_time < 94)
            scoreTime.source = "images/lv14.png"
        else
            scoreTime.source = "images/lv15.png"
    }

    function fuel() {
        if(dataFetcher.score_fuel < 7)
            scoreFuel.source = "images/lv1.png"
        else if(dataFetcher.score_fuel < 14)
            scoreFuel.source = "images/lv2.png"
        else if(dataFetcher.score_fuel < 21)
            scoreFuel.source = "images/lv3.png"
        else if(dataFetcher.score_fuel < 28)
            scoreFuel.source = "images/lv4.png"
        else if(dataFetcher.score_fuel < 35)
            scoreFuel.source = "images/lv5.png"
        else if(dataFetcher.score_fuel < 42)
            scoreFuel.source = "images/lv6.png"
        else if(dataFetcher.score_fuel < 49)
            scoreFuel.source = "images/lv7.png"
        else if(dataFetcher.score_fuel < 56)
            scoreFuel.source = "images/lv8.png"
        else if(dataFetcher.score_fuel < 63)
            scoreFuel.source = "images/lv9.png"
        else if(dataFetcher.score_fuel < 70)
            scoreFuel.source = "images/lv10.png"
        else if(dataFetcher.score_fuel < 76)
            scoreFuel.source = "images/lv11.png"
        else if(dataFetcher.score_fuel < 82)
            scoreFuel.source = "images/lv12.png"
        else if(dataFetcher.score_fuel < 88)
            scoreFuel.source = "images/lv13.png"
        else if(dataFetcher.score_fuel < 94)
            scoreFuel.source = "images/lv14.png"
        else
            scoreFuel.source = "images/lv15.png"
    }

    function safety() {
        if(dataFetcher.score_safety < 7)
            scoreSafety.source = "images/lv1.png"
        else if(dataFetcher.score_safety < 14)
            scoreSafety.source = "images/lv2.png"
        else if(dataFetcher.score_safety < 21)
            scoreSafety.source = "images/lv3.png"
        else if(dataFetcher.score_safety < 28)
            scoreSafety.source = "images/lv4.png"
        else if(dataFetcher.score_safety < 35)
            scoreSafety.source = "images/lv5.png"
        else if(dataFetcher.score_safety < 42)
            scoreSafety.source = "images/lv6.png"
        else if(dataFetcher.score_safety < 49)
            scoreSafety.source = "images/lv7.png"
        else if(dataFetcher.score_safety < 56)
            scoreSafety.source = "images/lv8.png"
        else if(dataFetcher.score_safety < 63)
            scoreSafety.source = "images/lv9.png"
        else if(dataFetcher.score_safety < 70)
            scoreSafety.source = "images/lv10.png"
        else if(dataFetcher.score_safety < 76)
            scoreSafety.source = "images/lv11.png"
        else if(dataFetcher.score_safety < 82)
            scoreSafety.source = "images/lv12.png"
        else if(dataFetcher.score_safety < 88)
            scoreSafety.source = "images/lv13.png"
        else if(dataFetcher.score_safety < 94)
            scoreSafety.source = "images/lv14.png"
        else
            scoreSafety.source = "images/lv15.png"
    }

    function type() {
        if(dataFetcher.driving_type === 0)
            drivingType.source = "images/sloth_type.png"
        else if(dataFetcher.driving_type === 1)
            drivingType.source = "images/wolf_type.png"
        else if(dataFetcher.driving_type === 2)
            drivingType.source = "images/panda_type.png"
        else if(dataFetcher.driving_type === 3)
            drivingType.source = "images/elephant_type.png"
        else if(dataFetcher.driving_type === 4)
            drivingType.source = "images/wildboar_type.png"
        else if(dataFetcher.driving_type === 5)
            drivingType.source = "images/lion_type.png"
        else if(dataFetcher.driving_type === 6)
            drivingType.source = "images/turtle_type.png"
        else if(dataFetcher.driving_type === 7)
            drivingType.source = "images/cheetah_type.png"
    }

    Connections {
        target: home

        onUpdateStyle: {
            time();
            safety();
            fuel();
            type();
        }
    }
}
