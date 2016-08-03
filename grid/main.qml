import QtQuick 2.5
import QtQuick.Window 2.2

Window {

    property int img_width: 1280
    property int img_height: 720
    property int n_column: 2
    property int border_width: 3
    property int grid_margin: 10

    id:main
    visible: true
    width: Screen.width/4
    height: Screen.height
    onAfterRendering: find_column_number()

    title: qsTr("Grid use")
    color: "#b3ffe6"
    // find_column_number()
    //    MouseArea {
    //        anchors.fill: parent
    //        onClicked: {
    //            Qt.quit();
    //        }
    //    }

    //    Text {
    //        text: qsTr("Hello World")
    //        anchors.centerIn: parent
    //    }
    //    Image {
    //        source: "img_1.jpg"
    //        anchors.fill: parent
    //        visible: true
    //    }

    ListModel {
        id: appModel
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_1.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_2.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_3.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_4.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_5.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_6.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_7.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_8.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_9.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_10.jpg" }

    }

    GridView {
        id: grid

        width: parent.width
        height: parent.height
        anchors.leftMargin: grid_margin
        anchors.topMargin: grid_margin
        anchors.fill: parent
        //           cellWidth:img_width;
        //           cellHeight: img_height;
        cellWidth: width / n_column;
        cellHeight: img_height*cellWidth/(2*img_width)
        focus: true
        model: appModel

        // highlight: Rectangle { width: grid.cellWidth; height: grid.cellHeight; color: "lightsteelblue" }

        delegate: Rectangle {
            id: rec
            border.width: border_width
            border.color: "green"
            width: grid.cellWidth - grid_margin
            height: grid.cellHeight - grid_margin

            Rectangle{
                id: img
                width: rec.width/2 - border_width
                height: rec.height - 2*border_width
                anchors.verticalCenter : rec.verticalCenter
                anchors.leftMargin: border_width
                anchors.left: rec.left

                Image {
                    id: myIcon
                    anchors.fill: img
                    width: rec.width/2
                    height: rec.height - 4
                    source: icon
                }
            }

            Rectangle{
                id:txt
                width: rec.width/2 - border_width
                height: rec.height - 2*border_width
                anchors.verticalCenter : rec.verticalCenter
                anchors.left: img.right
                color: "#66ffcc"

                Text {
                    id: textmess
                    width: txt.width
                    height: txt.height
                    anchors.fill: txt
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                    text: info
                    clip: txt
                    horizontalAlignment: Text.AlignJustify
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {parent.GridView.view.currentIndex = index
                    //console.log(index)
                }
            }
        }
    }


    function find_column_number()
    {
        if (main.width < 0.9*main.height) {
            n_column = 1
        }
        else  if (main.width < 1.7* main.height) {
            n_column = 2
        }
        else {
            n_column = 3
        }

        //console.log("n="+n_column)

    }
}



