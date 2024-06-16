import QtQuick 2.15

Canvas {
    id: drawPath
    property var points: []
    property color dotColor: "black"
    property real dotShape: 2
    property real dotSize: 3
    property real scale: 1.5
    property real offsetX: 210
    property real offsetY: 150

    onPaint: {
        var ctx = getContext("2d");

        ctx.clearRect(0, 0, width, height);
        ctx.fillStyle = dotColor;

        for (var i = 0; i < points.length; i++) {
            var point = points[i];
            var drawX = offsetX + point.x * scale;
            var drawY = offsetY + point.y * scale;

            ctx.beginPath();
            ctx.arc(drawX, drawY, dotSize, 0, dotShape * Math.PI);
            ctx.fill();
        }
    }
}
