import QtQuick 2.7
import VPlayApps 1.0

Navigation {
    property var initialMenuItem
    property var flickable

    drawer.anchors.topMargin: dp(Theme.navigationBar.height)

    Component.onCompleted: {
        var initObj =
        insertNavigationItem(0, Qt.createComponent("MenuItem.qml"))
        initObj.icon = initialMenuItem.icon
        initObj.pageToVisit = initialMenuItem.pageToVisit
        initObj.text = initialMenuItem.text
        currentIndex = 0
    }
}
