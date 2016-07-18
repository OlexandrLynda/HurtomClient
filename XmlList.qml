import QtQuick 2.2
import QtQuick.XmlListModel 2.0
//import QtQuick.Window 2.1

Rectangle {
    id: window

    anchors.fill: parent
    width: 800
    height: 480
    visible: false

    property string feedUrl: "https://toloka.to/rss.php?t=1&lite=1&cat=8&toronly=1&thumbs=1"
    property bool loading: feedModel.status === XmlListModel.Loading

    onLoadingChanged: {
        if (feedModel.status == XmlListModel.Ready)
            list.positionViewAtBeginning()
    }

    XmlListModel {
        id: feedModel

        source: window.feedUrl
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

    ListView {
        id: list

        anchors.fill: parent
        model: feedModel
        orientation: ListView.Vertical
        footer: footerText
        delegate: FeedDelegate {}
    }

    Component {
        id: footerText

        Rectangle {
            width: parent.width
            height: 20
            color: "lightgray"

            Text {
                text: "RSS Feed from Hurtom"
                anchors.centerIn: parent
                font.pixelSize: 14
            }
        }
    }
}
