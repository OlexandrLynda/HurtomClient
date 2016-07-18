import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hurtom client")

    header: ToolBar{
        id: toolBar
        Material.foreground: "white"

        RowLayout{
            spacing: 20
            anchors.fill: parent

            ToolButton{
                contentItem: Image{
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "Img/drawer.png"
                }
                onClicked:
                {
                    drawer.open()
                }
            }

            Label{
                id: titleLabel
                text: "Початкова сторінка"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    } //ToolBar

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        Rectangle {
            id: header
            width: parent.width
            height: toolBar.height
//            RowLayout{
//                spacing: 15
//                anchors.fill: parent

            TextField {
                id: searchField
                implicitWidth: parent.width / 10 * 7
                implicitHeight: parent.height / 10 * 9
                anchors.centerIn: parent
                placeholderText: "Пошук ..."
            }

//            Button {
//                height: header.height / 3 * 2
//                width: height
//                contentItem: Image{
//                    fillMode: Image.PreserveAspectFit
//                    horizontalAlignment: Image.AlignHCenter
//                    verticalAlignment: Image.AlignVCenter
//                    source: "Ico/search.png"
//                }
//                onClicked:
//                {
//                    //search(searchField.text)
//                }
//            }
//            }
        }

        ListView{
            id: listView
            currentIndex: -1
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: footer.top
            clip: true


            delegate: ItemDelegate{
                id: item
                width: parent.width
                //text: model.title

                Item{
                    id: empty
                    width: icon.width / 3
                }

                Image{
                    id: icon
                    height: parent.height / 3 * 2
                    width: height
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: empty.right
                    source: model.ico
                }

                Label{
                    text: model.title
                    anchors.left: icon.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: empty.width
                }

                highlighted: ListView.isCurrentItem
                onClicked: {
                    if(listView.currentIndex != index){
                        listView.currentIndex
                        titleLabel.text = model.title
                        //stackView.replace(model.source)
                        if(model.flags !== "no_http"){
                            rssNews.feedUrl = model.source
                        }
                        else{

                        }
                    }
                    drawer.close()
                }
            }

            model: ListModel{
                ListElement{title: "Загальне"; ico: "Ico/default.png"; source: "https://toloka.to/rss.php?t=1&lite=1&cat=11&thumbs=1"}
                ListElement{title: "Відео Гуртом"; ico: "Ico/hurtomVideo.gif"; flags: "no_http"}
                ListElement{title: "Фільми"; ico: "Ico/video.png"; source: "https://toloka.to/rss.php?t=1&lite=1&cat=8&toronly=1&thumbs=1"}
                ListElement{title: "Музика"; ico: "Ico/music.png"; source: "https://toloka.to/rss.php?t=1&lite=1&cat=7&toronly=1&thumbs=1"}
                ListElement{title: "Література"; ico: "Ico/book.png"; source: "https://toloka.to/rss.php?t=1&lite=1&cat=13&toronly=1&thumbs=1"}
                ListElement{title: "Програми"; ico: "Ico/app.png"; source: "https://toloka.to/rss.php?t=1&lite=1&cat=3&toronly=1&thumbs=1"}
                ListElement{title: "Ігри"; ico: "Ico/game.png"; source: "https://toloka.to/rss.php?t=1&lite=1&cat=4&toronly=1&thumbs=1"}
                ListElement{title: "Озвучення"; ico: "Ico/voiceRecorder.png"; flags: "no_http"}
                ListElement{title: "Смітник"; ico: "Ico/trash.png"; flags: "no_http" }
                //ListElement{title: "titleOfCategory"; source: "qrc:/pages/*.qml"
            }
            ScrollIndicator.vertical: ScrollIndicator{}
        }
        Rectangle {
            id: footer
            anchors.bottom: parent.bottom
            width: parent.width
            height: toolBar.height
            color: "green"

            RowLayout{
                ToolButton{text: "1"}
                ToolButton{text: "2"}
                ToolButton{text: "3"}
            }
        }
    }

    StackView{
        id: stackView
        anchors.fill: parent

        initialItem: Pane{
            id: pane

            Image{
                id: logo
                width: pane.availableWidth / 2
                height: pane.availableHeight / 2
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                fillMode: Image.PreserveAspectFit
                source: "Img/logo.png"
            }

            Label{
                text: "Гуртом толока. Опис: ..."
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
            }
        }
    }
    XmlList{
        id: rssNews
        onLoadingChanged: {
            if(loading == true){
                loadPopup.open()
            }
            else{
                loadPopup.close()
            }
        }
    }

    LoadPopup{
        id: loadPopup
    }
}
