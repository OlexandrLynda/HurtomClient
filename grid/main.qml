import QtQuick 2.5
import QtQuick.Window 2.2

Window {

    property int img_width: 448
    property int img_height: 252
    property int item_width: 0
    property int item_height: 0
    property int n_column: 2
    property int border_width: 3
    property int grid_margin: 10
    property int txt_lines: 5

    id:main
    visible: true
    width: Screen.width //use not all screen
    height: Screen.height
    onAfterRendering: find_column_number()


    title: qsTr("Grid use")
    color: "#b3ffe6"


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
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_11.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_12.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_13.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_14.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_15.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_16.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_17.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_18.jpg" }
        ListElement { info:"some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! some information! ";  icon: "img_19.jpg" }

    }

    GridView {
        id: grid

        width: parent.width
        height: parent.height
        anchors.leftMargin: grid_margin
        anchors.topMargin: grid_margin
        anchors.fill: parent
        cellWidth: width / n_column;
        cellHeight: item_height
        focus: true
        model: appModel

        delegate: Rectangle {
            id: rec
            border.width: border_width
            border.color: "green"
            width: grid.cellWidth - grid_margin
            height: grid.cellHeight - grid_margin

            Rectangle{
                id: img
                width: img_width*rec.height/(img_height) - border_width //rec.width/2 - border_width
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
                width: rec.width - img.width - 2*border_width
                height: rec.height - 2*border_width
                anchors.verticalCenter : rec.verticalCenter
                anchors.left: img.right
                color: "#66ffcc"

                Text {
                    id: textmess
                    width: txt.width
                    height: txt.height
                    anchors.fill: txt
                    font.pixelSize: txt.height / (txt_lines + 1)
                    wrapMode: Text.WordWrap
                    text: info
                    clip: txt
                    horizontalAlignment: Text.AlignJustify
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {parent.GridView.view.currentIndex = index
                }
            }
        }
    }


    function find_column_number()
    {
        if (item_height === 0 ) {
            if (main.width < 0.9*main.height) {
                n_column = 1
            }
            else  if (main.width < 1.7* main.height) {
                n_column = 2
            }
            else {
                n_column = 3
            }

            item_width = (((main.width - grid_margin) / n_column ) - grid_margin) / 2;
            item_height = img_height*item_width/(img_width);
        }
        else {
            n_column = main.width / (2*item_width);
        }

    }
}



