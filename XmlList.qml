import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.1
//import QtQuick.Window 2.1

Rectangle {
    id: mainView
    color: "lightgrey"

    function find_column_number()
    {
        if (mainView.width < 1.3 * mainView.height) {
            n_column = 1
        }
        else  if (mainView.width < 2 * mainView.height) {
            n_column = 2
        }
        else if (mainView.width < 3.5 * mainView.height){
            n_column = 3
        }
        else{
            n_column = 4;
        }
    }

    anchors.fill: parent
    width: 800
    height: 480
    visible: false

    property int img_width: 1280
    property int img_height: 720
    property int n_column: 2
    property int border_width: 3
    property int grid_margin: 10

    property string feedUrl: "https://toloka.to/rss.php?t=1&lite=1&cat=8&toronly=1&thumbs=1"
    property bool loading: feedModel.status === XmlListModel.Loading

    onLoadingChanged: {
        if (feedModel.status == XmlListModel.Ready)
            list.positionViewAtBeginning()
    }

    XmlListModel {
        id: feedModel

        source: mainView.feedUrl
        query: "/rss/channel/item"
        namespaceDeclarations: "declare namespace " +
                               "dc='http://purl.org/dc/elements/1.1/'; " +
                               "declare namespace " +
                               "annotate='http://purl.org/rss/1.0/modules/annotate/'; " +
                               "declare namespace " +
                               "rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#';"

        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "guid"; query: "guid/string()" }
        XmlRole { name: "isPermaLink"; query: "boolean(guid/@isPermaLink)" }
        XmlRole { name: "description"; query: "description/string()" }
        XmlRole { name: "dcCreator"; query: "dc:creator/string()" }
        XmlRole { name: "dcSubject"; query: "dc:subject/string()" }
        XmlRole { name: "category"; query: "category/string()" }
        XmlRole { name: "annotateReference"; query: "annotate:reference/@rdf:resource/string()" }
        XmlRole { name: "comments"; query: "comments/string()" }
        XmlRole { name: "pubDate"; query: "pubDate/string()" }
    }

    GridView {
        id: list
        width: parent.width
        height: parent.height
        anchors.leftMargin: grid_margin
        anchors.topMargin: grid_margin
        anchors.fill: parent
        cellWidth: width / n_column;
        cellHeight: img_height * cellWidth / (2 * img_width)
        //        highlightFollowsCurrentItem: true
        ScrollIndicator.vertical: ScrollIndicator { }
        model: feedModel
        focus: true
        delegate: FeedDelegate {
            id: delegate
            width: list.cellWidth - grid_margin
            height: list.cellHeight - grid_margin
            onRequestToOpenChanged: {
                if(requestToOpen)
                {
                    popup.titleSource = delegate.getInfo(0) + "\n\n" + delegate.getInfo(2);
                    popup.imgUrl = delegate.getInfo(1);

                    popup.open()
                    requestToOpen = false
                }

            }
        }

        Popup {
            id: popup

            property string titleSource
            property string imgUrl

            x: grid_margin
            y: grid_margin
            width: content.implicitWidth
            height: content.implicitHeight
            clip: true

            contentItem: Flickable {
                width: list.width - 2 * grid_margin
                height: list.height - 2 * grid_margin
                contentWidth: content.width
                contentHeight: content.height
                boundsBehavior: Flickable.OvershootBounds
                flickableDirection: Flickable.HorizontalAndVerticalFlick

                RowLayout {
                    id: content

                    Image {
                        id: img
                        source: popup.imgUrl
                        fillMode: Image.PreserveAspectFit

                        Image {

                             id: star
                             width: parent.height/5
                             height: parent.height/5
                             source: "Ico/star_yellow.png"

                             MouseArea {
                                     id: mouse_star
                                     anchors.fill: parent
                                     anchors.margins: -5
                                     onClicked: {
                                         //console.log("before " + parent.source)
                                         if (parent.source == "qrc:/Ico/star_yellow.png"){
                                            parent.source = "Ico/star_green.png"
                                         }
                                         else {
                                            parent.source = "Ico/star_yellow.png"
                                         }

                                         //console.log(parent.source)
                                     }
                                 }
                         }
                    }
                    TextArea {
                        id: titleLabel
                        text: popup.titleSource
                        readOnly: true
                        wrapMode: Text.Wrap
                        anchors.leftMargin: grid_margin
                        implicitWidth: list.width / 2 - 2 * grid_margin
                    }

                }
            }
        }



    }

}
