import QtQuick 2.7

Rectangle {
//    anchors.fill: /*parent*/

    Text{
        id: text
        text: "Тут буде статична інформація.\nПрошу пропустити цю сторінку!"
        font.pixelSize: 32
        anchors.centerIn: parent

        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation { target: text; property: "opacity"; from: 1; to: 0; duration: 1000;}
            NumberAnimation { target: text; property: "opacity"; from: 0; to: 1; duration: 900;}
        }
    }
}
