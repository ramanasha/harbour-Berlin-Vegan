/**
 *
 *  This file is part of the Berlin-Vegan guide (SailfishOS app version),
 *  Copyright 2015-2016 (c) by micu <micuintus.de> (micuintus@gmx.de).
 *
 *      <https://github.com/micuintus/harbour-Berlin-vegan>.
 *
 *  The Berlin-Vegan guide is Free Software:
 *  you can redistribute it and/or modify it under the terms of the
 *  GNU General Public License as published by the Free Software Foundation,
 *  either version 2 of the License, or (at your option) any later version.
 *
 *  Berlin-Vegan is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with The Berlin Vegan Guide.
 *
 *  If not, see <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>.
 *
**/

import QtQuick 2.2
import Sailfish.Silica 1.0
import QtPositioning 5.2
import BerlinVegan.components.platform 1.0 as BVApp
import BerlinVegan.components.generic 1.0 as BVApp


BVApp.Page {

    id: page
    title: restaurant.name

    property var restaurant
    property var positionSource

    SilicaFlickable {
        id: flicka
        anchors.fill: parent
        readonly property var nonDescriptionHeaderHeight: locationheader.height + iconToolBar.height
        contentHeight: descriptionText.y + descriptionText.height + BVApp.Theme.paddingLarge
        property real scrolledUpRatio: 1 - (contentY / nonDescriptionHeaderHeight)

        VerticalScrollDecorator {}

        BVApp.VenueDescriptionHeader {
            id: locationheader
            name: restaurant.name
            street: restaurant.street
            pictures: restaurant.pictures
            restaurantCoordinate: QtPositioning.coordinate(restaurant.latCoord, restaurant.longCoord)
            positionSource: page.positionSource

            opacity: flicka.scrolledUpRatio
            height: page.height / 2.7
            shrinkHeightBy: flicka.contentY

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top

                bottomMargin: BVApp.Theme.paddingSmall
            }
        }

        BVApp.IconToolBar {
            id: iconToolBar
            restaurant: page.restaurant

            anchors {
                left: parent.left
                right: parent.right
                top: locationheader.bottom

                leftMargin: BVApp.Theme.horizontalPageMargin
                rightMargin: BVApp.Theme.horizontalPageMargin
                topMargin: BVApp.Theme.paddingSmall
                bottomMargin: BVApp.Theme.paddingLarge
            }

            opacity: flicka.scrolledUpRatio
        }

        BVApp.CollapsibleItem {
            id: detailsCollapsible

            collapsedHeight: venueDetails.collapsedHeight
            expandedHeight: venueDetails.expandedHeight + BVApp.Theme.paddingLarge

            anchors {
                left: parent.left
                right: parent.right
                top: iconToolBar.bottom

            }

            contentItem: BVApp.VenueDetails {
                id: venueDetails
                restaurant: page.restaurant
                anchors.fill: parent
            }
        }

        Separator {
            id: separator
            width: parent.width
            horizontalAlignment: Qt.AlignCenter
            color: BVApp.Theme.dividerColor
            height: BVApp.Theme.dividerHeight

            anchors {
                left: descriptionText.left
                right: descriptionText.right
                top: detailsCollapsible.bottom
            }
        }

        Label {
            id: descriptionText
            font.pixelSize: BVApp.Theme.fontSizeSmall
            text: restaurant.comment
            wrapMode: Text.WordWrap
            color: BVApp.Theme.primaryColor

            anchors {
                left: parent.left
                right: parent.right
                top: separator.bottom
                margins: BVApp.Theme.paddingLarge
            }
        }
        VerticalScrollDecorator {}

    }
}

