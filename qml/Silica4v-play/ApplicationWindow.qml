import VPlayApps 1.0

import QtQuick 2.7

import BerlinVegan.components.platform 1.0 as BVApp

App {

    id: app

    property var cover
    property var initialPage

    onInitTheme: {
        Theme.navigationBar.backgroundColor = BVApp.Theme.highlightDimmerColor
        Theme.navigationBar.titleColor = "white"
        // otherwise tintColor is used (see below) and you might have a hard time seeing navigation
        Theme.navigationBar.itemColor = Theme.navigationBar.titleColor
        // accent color, e.g. for icons
        Theme.colors.tintColor = BVApp.Theme.highlightDimmerColor
        // otherwise it's greyish on iOS
        Theme.colors.secondaryBackgroundColor = "white"
        // we need white text in the status bar, because of the Berlin-Vegan green
        Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite
        // replaces the default icon font
        Theme.iconFont = materialicons
        // mapping from fontawesome to materialicons:
        // those icons are hard-coded e.g. into the SearchBar or into the NavigationBar
        IconType.angleleft = "keyboard_arrow_left"
        IconType.refresh = "refresh"
        IconType.search = "search"
        IconType.times = "clear"
        IconType.timescircle = "clear"
    }

    FontLoader {
        id: materialicons;
        source: "qrc:/assets/MaterialIcons-Regular.ttf"
    }

    Component.onCompleted: {
        // We need to access the dp() function from the Theme component
        BVApp.Theme.myApp = app
    }
}
