import QtQuick

Window {
    width: 1980
    height: 1080
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: chaharbagh
        width: 40
        height: 40
        border.color: "black"
        border.width: 1
        x: 260
        y: 30
        radius: 180

        Text {

            topPadding: 9
            leftPadding: 4
            text: qsTr("Line_4")
            color: "#FDD835"
        }

        Text {
            anchors.top: chaharbagh.top
            anchors.topMargin: -20
            anchors.left: chaharbagh.left
            anchors.leftMargin: -10
            text: qsTr("chaharbagh")
        }
    }

    Rectangle {
        id: line6_1
        width: 3
        height: 180
        color: "yellow"
        anchors.top: chaharbagh.bottom
        anchors.left: (chaharbagh.left)
        anchors.leftMargin: chaharbagh.width / 2 - 1
    }

    Rectangle {
        id: kashani
        width: 35
        height: 35
        border.color: "black"
        border.width: 1
        anchors.left: chaharbagh.left
        anchors.leftMargin: (chaharbagh.width - kashani.width) / 2
        anchors.top: line6_1.bottom
        radius: 180

        Text {
            anchors.left: kashani.left
            anchors.leftMargin: -45
            text: qsTr("Kashani")
        }
    }

    Rectangle {
        id: line6_2
        width: 3
        height: 100
        color: "yellow"
        anchors.top: kashani.bottom
        anchors.left: (kashani.left)
        anchors.leftMargin: kashani.width / 2 - 1
    }

    Rectangle {
        id: alamehjafari
        width: 35
        height: 35
        border.color: "black"
        border.width: 1
        anchors.top: line6_2.bottom
        anchors.left: (kashani.left)
        radius: 180

        Text {
            anchors.left: alamehjafari.left
            anchors.leftMargin: -75
            text: qsTr("Alameh Jafari")
        }
    }

    Rectangle {
        width: 3
        height: 100
        color: "yellow"
        anchors.top: alamehjafari.bottom
        anchors.left: (alamehjafari.left)
        anchors.leftMargin: alamehjafari.width / 2 - 1
    }
}
