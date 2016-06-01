import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {

    id: page
    property var restaurant

    anchors.fill: parent

    SilicaFlickable {
        id: flicka
        anchors.fill: parent
        contentHeight: image.initalHeight + icontoolbar.height + dalabel.height

        VerticalScrollDecorator {}

        Image {
            id: image

            source: restaurant.pictures[0].url
            property var initalHeight: page.height/3

            fillMode: Image.PreserveAspectCrop

            height: Math.max(initalHeight - flicka.contentY,0)
            y: flicka.contentY
            opacity: 1 - flicka.contentY / (page.height/3)
        }

        Rectangle {
            x: myheader.extraContent.x + myheader.extraContent.width - 10 // - flicka.contentY * 0.1// - Theme.paddingLarge
            y: myheader.y + myheader.childrenRect.y - 7 - flicka.contentY *0.1 // + flicka.contentY * 0.4
            height: myheader.childrenRect.height + 14 // + 2*Theme.paddingLarge
            width: myheader.childrenRect.width + 20 - myheader.extraContent.width // + 2*Theme.paddingLarge
            radius: 5
            color: Theme.highlightDimmerColor
            opacity: 0.6  - flicka.contentY / (page.height/3)
        }

        PageHeader {
            id: myheader

            title : restaurant.name
            y: 100  + flicka.contentY * 0.5
            opacity: 1 - flicka.contentY / (page.height/3)
        }

        IconToolBar {
            id: icontoolbar
            restaurant: page.restaurant

            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }

            y: image.initalHeight + Theme.paddingLarge
            opacity: 1 - flicka.contentY / (page.height/3)
        }

        Label {
            id: dalabel
            font.pixelSize: Theme.fontSizeSmall
            text: restaurant.comment
            wrapMode: Text.WordWrap

            anchors {
                left: parent.left
                right: parent.right
                top: icontoolbar.bottom
                margins: Theme.paddingLarge
            }
        }
    }
}

