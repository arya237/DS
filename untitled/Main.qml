import QtQuick

Window {
    width: 1980
    height: 1080
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: chaharbagh
        width: 35
        height: 35
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
            font.pixelSize: 10
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
        id: line4_1
        width: 3
        height: 140
        color: "yellow"
        anchors.top: chaharbagh.bottom
        anchors.left: (chaharbagh.left)
        anchors.leftMargin: chaharbagh.width / 2 - 1
    }

    Rectangle {
        id: kashani
        width: 30
        height: 30
        border.color: "black"
        border.width: 1
        anchors.left: chaharbagh.left
        anchors.leftMargin: (chaharbagh.width - kashani.width) / 2
        anchors.top: line4_1.bottom
        radius: 180

        Text {
            anchors.left: kashani.left
            anchors.leftMargin: -45
            text: qsTr("Kashani")
        }
    }

    Rectangle {
        id: line4_2
        width: 3
        height: 70
        color: "yellow"
        anchors.top: kashani.bottom
        anchors.left: (kashani.left)
        anchors.leftMargin: kashani.width / 2 - 1
    }

    Rectangle {
        id: alamehjafari
        width: 30
        height: 30
        border.color: "black"
        border.width: 1
        anchors.top: line4_2.bottom
        anchors.left: (kashani.left)
        radius: 180

        Text {
            anchors.left: alamehjafari.left
            anchors.leftMargin: -75
            text: qsTr("Alameh Jafari")
        }
    }

    Rectangle {
        id: line4_3
        width: 3
        height: 70
        color: "yellow"
        anchors.top: alamehjafari.bottom
        anchors.left: (alamehjafari.left)
        anchors.leftMargin: alamehjafari.width / 2 - 1
    }

    Rectangle {
        id: eramesabz
        width: 30
        height: 30
        border.color: "black"
        border.width: 1
        anchors.top: line4_3.bottom
        anchors.left: (kashani.left)
        radius: 180

        Text {
            anchors.left: eramesabz.left
            anchors.leftMargin: -70
            text: qsTr("Eram-e Sabz")
        }
    }

    Rectangle {
        id: line4_4
        width: 3
        height: 70
        color: "yellow"
        anchors.top: eramesabz.bottom
        anchors.left: (eramesabz.left)
        anchors.leftMargin: eramesabz.width / 2 - 1
    }

    Rectangle {
        id: meydaneazadi
        width: 30
        height: 30
        border.color: "black"
        border.width: 1
        anchors.top: line4_4.bottom
        anchors.left: (eramesabz.left)
        radius: 180

        Text {
            anchors.left: meydaneazadi.left
            anchors.leftMargin: -90
            text: qsTr("Meydan-e Azadi")
        }
    }

    Rectangle {
        id: line4_5
        width: 60
        height: 3
        color: "yellow"
        anchors.top: meydaneazadi.top
        anchors.topMargin: meydaneazadi.height / 2
        anchors.left: (meydaneazadi.right)
    }

    Rectangle {
        id: ostadmoin
        width: 30
        height: 30
        border.color: "black"
        border.width: 1
        anchors.top: meydaneazadi.top
        anchors.left: (line4_5.right)
        radius: 180

        Text {
            anchors.top: ostadmoin.top
            anchors.topMargin: -20
            text: qsTr("Ostad Mo'in")
        }
    }

    Rectangle {
        id: line4_6
        width: 60
        height: 3
        color: "yellow"
        anchors.top: ostadmoin.top
        anchors.topMargin: ostadmoin.height / 2
        anchors.left: (ostadmoin.right)
    }

    Rectangle {
        id: shademan
        width: 30
        height: 30
        border.color: "black"
        border.width: 1
        anchors.top: ostadmoin.top
        anchors.left: (line4_6.right)
        radius: 180

        Text {
            anchors.top: shademan.top
            anchors.topMargin: -20
            text: qsTr("Shademan")
        }
    }

    Rectangle {
        id: line4_7
        width: 60
        height: 3
        color: "yellow"
        anchors.top: shademan.top
        anchors.topMargin: shademan.height / 2
        anchors.left: (shademan.right)
    }

    Rectangle {
        id: towhid
        width: 30
        height: 30
        border.color: "black"
        border.width: 1
        anchors.top: shademan.top
        anchors.left: (line4_7.right)
        radius: 180

        Text {
            anchors.top: towhid.top
            anchors.topMargin: -20
            text: qsTr("Towhid")
        }
    }
}
