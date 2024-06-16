import QtQuick 2.15

Item {
    id: safetydetail

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
        id: safety_detail_main

        width: parent.width
        height: parent.height * 0.8
        anchors.top: blank_style_main.bottom

        Image {
            source: "images/safety_main.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: scoreSafety
            source: safety()

            width: 230
            height: 50

            x: 90
            y: 170
        }

        Image {
            id: scoreDecel
            source: decel()

            width: 70
            height: 70

            x: 330
            y: 255
        }

        Image {
            id: scoreAccel
            source: accel()

            width: 70
            height: 70

            x: 330
            y: 355
        }

        Image {
            id: scoreNight
            source: night()

            width: 70
            height: 70

            x: 330
            y: 455
        }
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

    function decel() {
        if(dataFetcher.dcel_score > 70)
            scoreDecel.source = "images/good.png"
        else if(dataFetcher.dcel_score > 40)
            scoreDecel.source = "images/normal.png"
        else
            scoreDecel.source = "images/bad.png"
    }

    function accel() {
        if(dataFetcher.acel_score > 70)
            scoreAccel.source = "images/good.png"
        else if(dataFetcher.acel_score > 40)
            scoreAccel.source = "images/normal.png"
        else
            scoreAccel.source = "images/bad.png"
    }

    function night() {
        if(dataFetcher.night_score > 70)
            scoreNight.source = "images/good.png"
        else if(dataFetcher.night_score > 40)
            scoreNight.source = "images/normal.png"
        else
            scoreNight.source = "images/bad.png"
    }

    Connections {
        target: home

        onUpdateStyle: {
            safety();
            decel();
            accel();
            night();
        }
    }
}
