import QtQuick 2.2
import QtQuick.XmlListModel 2.0
//import QtQuick.Window 2.1

Rectangle {
    id: mainView

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
        model: feedModel
        footer: footerText
        focus: true
        delegate: FeedDelegate {
            width: list.cellWidth - grid_margin
            height: list.cellHeight - grid_margin
        }
    }

    Component {
        id: footerText

        Rectangle {
            width: parent.width
            height: 1
            color: "red"
        }
    }
}
