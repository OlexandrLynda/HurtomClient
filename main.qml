import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hurtom client")

    Column {
        TextField {
            id: input
            height: 30
            width: mainWindow.width / 2
            font.pixelSize: 15
            placeholderText: qsTr("Search...")
            onAccepted: json.getData(input.text)
        }

        JsonSearch {
            id: json
            width: mainWindow.width
        }
    }
}
