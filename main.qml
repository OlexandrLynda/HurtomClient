import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hurtom client")


    Button{
        width: parent.window.width/3
        height: parent.window.height/3
        text: "Hi"
    }

}
