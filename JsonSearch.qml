import QtQuick 2.7

Rectangle {
    height: 400
    width: 600

    ListView {
        id: listview
        anchors.fill: parent
        model: model
        delegate: Column {
            id: delegate
            width: delegate.ListView.view.width
            spacing: 2

            Text {
                width: parent.width
                font.bold: true
                font.pixelSize: 18
                wrapMode: Text.WordWrap
                text: title;
            }

            Text {
                text: "id: " + id;
            }

            Text {
                text: "link: " + link;
            }


            Text {
                text: "author: " + author;
            }

            Text {
                text: "comments: " + comments;
            }

            Text {
                text: "size: " + size;
            }

            Text {
                text: "seeders: " + seeders;
            }

            Text {
                text: "leechers: " + leechers;
            }

            Text {
                text: "complete: " + complete;
            }
        }
    }

    ListModel {
        id: model
    }

    function getData(request) {
        var xmlhttp = new XMLHttpRequest();
        request = getRequest(request);
        var url = "https://toloka.to/api.php?search=" + request;

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                updateModel(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function getRequest(request) {
        var splittedRequest = request.split(" ");
        var result = "";
        result += splittedRequest[0];
        for (var i = 1; i < splittedRequest.length; i++){
            result += "+";
            result += splittedRequest[i];
        }
        return result;
    }

    function updateModel(response) {
        model.clear();
        var arr = JSON.parse(response);
        for(var i = 0; i < arr.length; i++) {
            listview.model.append( {
                                      id: arr[i].id,
                                      link: arr[i].link,
                                      title: arr[i].title,
                                      author: arr[i].author,
                                      comments: arr[i].comments,
                                      size: arr[i].size,
                                      seeders: arr[i].seeders,
                                      leechers: arr[i].leechers,
                                      complete: arr[i].complete
                                  } );
        }
    }
}
