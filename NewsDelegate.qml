import QtQuick 2.5
import QtQuick.Layouts 1.3

Component{

    Rectangle{
        id: backgroud
        color: "green"

        function getImageUrl(str){
            var matches = str.match(/<img src="(.*?)"/g);
            var result = "";
            if (matches === null) {
                result = "qrc:/Img/cropped-logo.png"
            }
            else {
                result = matches[0];
                result = result.slice(result.indexOf("\"") + 1, result.length - 1);
                result = "https:" + result;
            }

            return result;
        }

        // Deletes all HTML tags from str
        function getCleanText(str){
            var clean = str.replace(/<\/?[^>]+(>|$)/g, "");
            return clean;
        }
        Image {
            id: titleImage
            height: parent.height
            width: parent.width
            source: getImageUrl(description)
            fillMode: Image.PreserveAspectFit
        }
        Text{
            text: "Title"
        }
    }

}
