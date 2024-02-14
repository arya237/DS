import QtQuick
import QtQuick.Controls

Window {
    width: 1980
    height: 1080
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: chaharbagh
        width: 35
        height: 35
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        x: 170
        y: 20
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
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.left: chaharbagh.left
        anchors.leftMargin: (chaharbagh.width - kashani.width) / 2
        anchors.top: line4_1.bottom
        radius: 180

        Text {
            anchors.left: kashani.left
            anchors.leftMargin: -40
            text: qsTr("Kashani")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_2
        width: 3
        height: 45
        color: "yellow"
        anchors.top: kashani.bottom
        anchors.left: (kashani.left)
        anchors.leftMargin: kashani.width / 2 - 1
    }

    Rectangle {
        id: alamehjafari
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_2.bottom
        anchors.left: (kashani.left)
        radius: 180

        Text {
            anchors.left: alamehjafari.left
            anchors.leftMargin: -65
            text: qsTr("Alameh Jafari")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_3
        width: 3
        height: 45
        color: "yellow"
        anchors.top: alamehjafari.bottom
        anchors.left: (alamehjafari.left)
        anchors.leftMargin: alamehjafari.width / 2 - 1
    }

    Rectangle {
        id: eramesabz
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_3.bottom
        anchors.left: (kashani.left)
        radius: 180

        Text {
            anchors.left: eramesabz.left
            anchors.leftMargin: -60
            text: qsTr("Eram-e Sabz")
            font.pixelSize: 10
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
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_4.bottom
        anchors.left: (eramesabz.left)
        radius: 180

        Text {
            anchors.left: meydaneazadi.left
            anchors.leftMargin: -77
            text: qsTr("Meydan-e Azadi")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_5
        width: 25
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
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: meydaneazadi.top
        anchors.left: (line4_5.right)
        radius: 180

        Text {
            anchors.top: ostadmoin.top
            anchors.topMargin: -20
            x: -15
            text: qsTr("Ostad Mo'in")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_6
        width: 25
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
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: ostadmoin.top
        anchors.left: (line4_6.right)
        radius: 180

        Text {
            anchors.top: shademan.top
            anchors.topMargin: -20
            text: qsTr("Shademan")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_7
        width: 25
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
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: shademan.top
        anchors.left: (line4_7.right)
        radius: 180

        Text {
            anchors.top: towhid.top
            anchors.topMargin: -20
            text: qsTr("Towhid")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_8
        width: 55
        height: 3
        color: "yellow"
        anchors.top: towhid.top
        anchors.topMargin: towhid.height / 2
        anchors.left: (towhid.right)
    }

    Rectangle {
        id: meydaneenghelab
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: shademan.top
        anchors.left: (line4_8.right)
        radius: 180

        Text {
            anchors.bottom: meydaneenghelab.bottom
            anchors.bottomMargin: -20
            anchors.left: meydaneenghelab.left
            anchors.leftMargin: -50
            text: qsTr("Meydan-e Enghelab-e Eslami")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_9
        width: 55
        height: 3
        color: "yellow"
        anchors.top: meydaneenghelab.top
        anchors.topMargin: meydaneenghelab.height / 2
        anchors.left: (meydaneenghelab.right)
    }

    Rectangle {
        id: teatreshahr
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: meydaneenghelab.top
        anchors.left: (line4_9.right)
        radius: 180

        Text {
            anchors.top: teatreshahr.top
            anchors.topMargin: -20
            x: -15
            text: qsTr("Teatr-e Shahr")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_10
        width: 60
        height: 3
        color: "yellow"
        anchors.top: teatreshahr.top
        anchors.topMargin: teatreshahr.height / 2
        anchors.left: (teatreshahr.right)
    }

    Rectangle {
        id: ferdowsi
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: teatreshahr.top
        anchors.left: (line4_10.right)
        radius: 180

        Text {
            anchors.top: ferdowsi.top
            anchors.topMargin: -20
            x: -5
            text: qsTr("Ferdowsi")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_11
        width: 25
        height: 3
        color: "yellow"
        anchors.top: ferdowsi.top
        anchors.topMargin: ferdowsi.height / 2
        anchors.left: (ferdowsi.right)
    }

    Rectangle {
        id: line4_12
        width: 3
        height: 55
        color: "yellow"
        anchors.top: line4_11.top
        anchors.left: line4_11.right
    }

    Rectangle {
        id: line4_13
        width: 25
        height: 3
        color: "yellow"
        anchors.top: line4_12.bottom
        anchors.left: (line4_12.left)
    }

    Rectangle {
        id: darvazehdowlat
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_13.top
        anchors.topMargin: -(darvazehdowlat.height / 2)
        anchors.left: (line4_13.right)
        radius: 180

        Text {
            anchors.top: darvazehdowlat.top
            anchors.topMargin: 30
            x: 30
            text: qsTr("Darvazeh Dowlat")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_14
        width: 70
        height: 3
        color: "yellow"
        anchors.top: darvazehdowlat.top
        anchors.topMargin: darvazehdowlat.height / 2
        anchors.left: (darvazehdowlat.right)
    }

    Rectangle {
        id: darvazehshemiran
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_14.top
        anchors.topMargin: -(darvazehshemiran.height / 2)
        anchors.left: (line4_14.right)
        radius: 180

        Text {
            anchors.top: darvazehshemiran.top
            anchors.topMargin: -15
            x: 5
            text: qsTr("Darvazeh Shemiran")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_15
        width: 40
        height: 3
        color: "yellow"
        anchors.top: darvazehshemiran.top
        anchors.topMargin: darvazehshemiran.height / 2
        anchors.left: (darvazehshemiran.right)
    }

    Rectangle {
        id: line4_16
        width: 3
        height: 35
        color: "yellow"
        anchors.top: line4_15.top
        anchors.left: (line4_15.right)
    }

    Rectangle {
        id: line4_17
        width: 40
        height: 3
        color: "yellow"
        anchors.top: line4_16.bottom
        anchors.left: (line4_16.left)
    }

    Rectangle {
        id: meydaneshohada
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_17.top
        anchors.topMargin: -(meydaneshohada.height / 2)
        anchors.left: (line4_17.right)
        radius: 180

        Text {
            anchors.top: darvazehshemiran.top
            y: 30
            x: -50
            text: qsTr("Meydan-e Shohada")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_18
        width: 40
        height: 3
        color: "yellow"
        anchors.top: meydaneshohada.top
        anchors.topMargin: meydaneshohada.height / 2
        anchors.left: (meydaneshohada.right)
    }

    Rectangle {
        id: ebnesina
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_18.top
        anchors.topMargin: -(ebnesina.height / 2)
        anchors.left: (line4_18.right)
        radius: 180

        Text {
            anchors.top: ebnesina.top
            anchors.topMargin: 30
            text: qsTr("Ebn-e Sina")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_19
        width: 30
        height: 3
        color: "yellow"
        anchors.top: ebnesina.top
        anchors.topMargin: ebnesina.height / 2
        anchors.left: (ebnesina.right)
    }

    Rectangle {
        id: pirouzi
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_19.top
        anchors.topMargin: -(pirouzi.height / 2)
        anchors.left: (line4_19.right)
        radius: 180

        Text {
            anchors.top: pirouzi.top
            anchors.topMargin: 30
            text: qsTr("Pirouzi")
            font.pixelSize: 10
        }
    }
    Rectangle {
        id: line4_20
        width: 40
        height: 3
        color: "yellow"
        anchors.top: pirouzi.top
        anchors.topMargin: pirouzi.height / 2
        anchors.left: (pirouzi.right)
    }

    Rectangle {
        id: nabard
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_20.top
        anchors.topMargin: -(nabard.height / 2)
        anchors.left: (line4_20.right)
        radius: 180

        Text {
            anchors.top: nabard.top
            anchors.topMargin: 30
            text: qsTr("Nabard")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_21
        width: 30
        height: 3
        color: "yellow"
        anchors.top: nabard.top
        anchors.topMargin: nabard.height / 2
        anchors.left: (nabard.right)
    }

    Rectangle {
        id: nirohavaei
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_21.top
        anchors.topMargin: -(nirohavaei.height / 2)
        anchors.left: (line4_21.right)
        radius: 180

        Text {
            anchors.top: nirohavaei.top
            anchors.topMargin: 30
            text: qsTr("Nirou Havai")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_22
        width: 40
        height: 3
        color: "yellow"
        anchors.top: nirohavaei.top
        anchors.topMargin: nirohavaei.height / 2
        anchors.left: (nirohavaei.right)
    }

    Rectangle {
        id: shahidkulahdoz
        width: 35
        height: 35
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line4_22.top
        anchors.topMargin: -(shahidkulahdoz.height / 2)
        anchors.left: (line4_22.right)
        radius: 180

        Text {
            anchors.top: shahidkulahdoz.top
            anchors.topMargin: 30
            text: qsTr("Nirou Havai")
            font.pixelSize: 10
        }

        Text {

            topPadding: 9
            leftPadding: 4
            text: qsTr("Line_4")
            color: "#FDD835"
            font.pixelSize: 10
        }
    }
}
