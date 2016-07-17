import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Popup{
    id: loadPopup
    x: (parent.width - width) / 2
    y: parent.height / 6
    width: Math.min(parent.width, parent.height) / 3 * 2
    height: loadColumn.implicitHeight + topPadding + bottomPadding
    modal: true
    focus: true

    contentItem: ColumnLayout{
        id:loadColumn
        spacing: 30

        Image{
            id: cropLogo
            width: loadPopup.width / 1.5
            height: loadPopup.height / 2
            anchors.centerIn: loadColumn
            fillMode: Image.PreserveAspectFit
            source: "Img/cropped-logo.png"
        }

        Label{
            id: loadText
            text: "Завантаження..."
            font.pixelSize: 20
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            anchors.top: cropLogo.bottom
            Layout.fillWidth: true
            anchors.bottomMargin: 20

        }

        ProgressBar {
            indeterminate: true
            width: loadPopup.availableWidth / 3
            anchors.top: loadText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
