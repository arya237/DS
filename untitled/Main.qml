import QtQuick
import QtQuick.Controls

Window {
    width: 1920
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
        y: 12
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
            anchors.topMargin: -15
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
        height: 40
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
        height: 65
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
        width: 70
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
        width: 70
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
            x: -50
            text: qsTr("Teatr-e Shahr")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line4_10
        width: 65
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
        width: 40
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
        width: 45
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
            anchors.topMargin: 35
            text: qsTr("Shahid Koulahdouz")
        }

        Text {

            topPadding: 9
            leftPadding: 4
            text: qsTr("Line_4")
            color: "#FDD835"
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: tajrish
        width: 35
        height: 35
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: chaharbagh.top
        anchors.left: darvazehdowlat.left
        anchors.leftMargin: -(tajrish.width - darvazehdowlat.width)
        radius: 180

        Text {
            anchors.top: tajrish.top
            anchors.topMargin: -14
            text: qsTr("Tajrish")
            font.pixelSize: 10
        }

        Text {

            topPadding: 9
            leftPadding: 4
            text: qsTr("Line_1")
            color: "red"
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_1
        width: 3
        height: 22
        color: "red"
        anchors.top: tajrish.bottom
        anchors.left: tajrish.right
        anchors.leftMargin: -(tajrish.width / 2) - 1
    }

    Rectangle {
        id: gheytariyeh
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_1.bottom
        anchors.left: (tajrish.left)
        anchors.leftMargin: ((tajrish.width - gheytariyeh.width) / 2)
        radius: 180

        Text {
            anchors.right: gheytariyeh.left
            anchors.rightMargin: 5
            text: qsTr("Gheytariyeh")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_2
        width: 3
        height: 22
        color: "red"
        anchors.top: gheytariyeh.bottom
        anchors.left: gheytariyeh.left
        anchors.leftMargin: (gheytariyeh.width / 2) - 1
    }

    Rectangle {
        id: golhak
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_2.bottom
        anchors.left: (gheytariyeh.left)
        anchors.leftMargin: ((tajrish.width - golhak.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: golhak.left
            anchors.rightMargin: 5
            text: qsTr("Gholhak")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_3
        width: 3
        height: 25
        color: "red"
        anchors.top: golhak.bottom
        anchors.left: golhak.left
        anchors.leftMargin: (golhak.width / 2) - 1
    }

    Rectangle {
        id: mirdamad
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_3.bottom
        anchors.left: (golhak.left)
        anchors.leftMargin: ((tajrish.width - mirdamad.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: mirdamad.left
            anchors.rightMargin: 5
            text: qsTr("Mirdamad")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_4
        width: 3
        height: 25
        color: "red"
        anchors.top: mirdamad.bottom
        anchors.left: mirdamad.left
        anchors.leftMargin: (mirdamad.width / 2) - 1
    }

    Rectangle {
        id: shahidhaghani
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_4.bottom
        anchors.left: (mirdamad.left)
        anchors.leftMargin: ((tajrish.width - shahidhaghani.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: shahidhaghani.left
            anchors.rightMargin: 5
            text: qsTr("Shahid Haghani")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_5
        width: 3
        height: 15
        color: "red"
        anchors.top: shahidhaghani.bottom
        anchors.left: shahidhaghani.left
        anchors.leftMargin: (shahidhaghani.width / 2) - 1
    }

    Rectangle {
        id: shahidbeheshti
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_5.bottom
        anchors.left: (shahidhaghani.left)
        anchors.leftMargin: ((tajrish.width - shahidbeheshti.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: shahidbeheshti.left
            y: -5
            text: qsTr("Shahid Beheshti")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_5_5
        width: 3
        height: 15
        color: "red"
        anchors.top: shahidbeheshti.bottom
        anchors.left: shahidbeheshti.left
        anchors.leftMargin: (shahidbeheshti.width / 2) - 1
    }

    Rectangle {
        id: shahidmofatteh
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_5_5.bottom
        anchors.left: (shahidhaghani.left)
        anchors.leftMargin: ((tajrish.width - shahidmofatteh.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: shahidmofatteh.left
            anchors.rightMargin: 5
            text: qsTr("Shahid Mofatteh")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_6
        width: 3
        height: 15
        color: "red"
        anchors.top: shahidmofatteh.bottom
        anchors.left: shahidmofatteh.left
        anchors.leftMargin: (shahidmofatteh.width / 2) - 1
    }

    Rectangle {
        id: haftometir
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_6.bottom
        anchors.left: (shahidmofatteh.left)
        anchors.leftMargin: ((tajrish.width - haftometir.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: haftometir.left
            anchors.rightMargin: 5
            text: qsTr("Haftom-e Tir")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_7
        width: 3
        height: 40
        color: "red"
        anchors.top: haftometir.bottom
        anchors.left: haftometir.left
        anchors.leftMargin: (haftometir.width / 2) - 1
    }

    Rectangle {
        id: talaghani
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: ferdowsi.top
        anchors.left: (haftometir.left)
        anchors.leftMargin: ((tajrish.width - haftometir.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: talaghani.left
            anchors.rightMargin: 0
            text: qsTr("Talaghani")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_8
        width: 3
        height: 25
        color: "red"
        anchors.top: talaghani.bottom
        anchors.left: talaghani.left
        anchors.leftMargin: (talaghani.width / 2) - 2
    }

    Rectangle {
        id: line1_9
        width: 3
        height: 25
        color: "red"
        anchors.top: darvazehdowlat.bottom
        anchors.left: darvazehdowlat.left
        anchors.leftMargin: (darvazehdowlat.width / 2) - 1
    }

    Rectangle {
        id: panzadahekhordad
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_9.bottom
        anchors.left: (darvazehdowlat.left)
        anchors.leftMargin: ((tajrish.width - panzadahekhordad.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: panzadahekhordad.left
            anchors.rightMargin: 5
            text: qsTr("Panzadah-e Khordad")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_10
        width: 3
        height: 25
        color: "red"
        anchors.top: panzadahekhordad.bottom
        anchors.left: panzadahekhordad.left
        anchors.leftMargin: (darvazehdowlat.width / 2) - 1
    }

    Rectangle {
        id: shoush
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_10.bottom
        anchors.left: (panzadahekhordad.left)
        anchors.leftMargin: ((tajrish.width - shoush.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: shoush.left
            anchors.rightMargin: 5
            text: qsTr("Shoush")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_11
        width: 3
        height: 20
        color: "red"
        anchors.top: shoush.bottom
        anchors.left: shoush.left
        anchors.leftMargin: (shoush.width / 2) - 1
    }

    Rectangle {
        id: jonoubterminal
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_11.bottom
        anchors.left: (shoush.left)
        anchors.leftMargin: ((tajrish.width - jonoubterminal.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: jonoubterminal.left
            anchors.rightMargin: 5
            text: qsTr("Jonoub Terminal")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_12
        width: 3
        height: 20
        color: "red"
        anchors.top: jonoubterminal.bottom
        anchors.left: jonoubterminal.left
        anchors.leftMargin: (jonoubterminal.width / 2) - 1
    }

    Rectangle {
        id: shahrerey
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_12.bottom
        anchors.left: (jonoubterminal.left)
        anchors.leftMargin: ((tajrish.width - shahrerey.width) / 2) - 2
        radius: 180

        Text {
            anchors.right: shahrerey.left
            anchors.rightMargin: 5
            text: qsTr("Shahr-e Rey")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line1_13
        width: 3
        height: 35
        color: "red"
        anchors.top: shahrerey.bottom
        anchors.left: shahrerey.left
        anchors.leftMargin: (shahrerey.width / 2) - 1
    }

    Rectangle {
        id: kahrizak
        width: 35
        height: 35
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line1_13.bottom
        anchors.left: shahrerey.left
        anchors.leftMargin: -((tajrish.width - shahrerey.width) / 2)
        radius: 180

        Text {
            anchors.left: kahrizak.left
            anchors.leftMargin: -40
            text: qsTr("Kahrizak")
            font.pixelSize: 10
        }

        Text {

            topPadding: 9
            leftPadding: 4
            text: qsTr("Line_1")
            color: "red"
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: azadegan
        width: 35
        height: 35
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: kahrizak.top
        anchors.left: teatreshahr.left
        anchors.leftMargin: -((azadegan.width - teatreshahr.width) / 2)
        radius: 180

        Text {
            anchors.left: azadegan.left
            anchors.leftMargin: -45
            text: qsTr("Azadegan")
            font.pixelSize: 10
        }

        Text {

            topPadding: 9
            leftPadding: 4
            text: qsTr("Line_3")
            color: "blue"
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_1
        width: 3
        height: 20
        color: "blue"
        anchors.bottom: azadegan.top
        anchors.left: azadegan.left
        anchors.leftMargin: (azadegan.width / 2) - 1
    }

    Rectangle {
        id: zamzam
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.bottom: line3_1.top
        anchors.left: (azadegan.left)
        anchors.leftMargin: ((azadegan.width - zamzam.width) / 2)
        radius: 180

        Text {
            anchors.left: zamzam.left
            anchors.leftMargin: -40
            text: qsTr("Zamzam")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_2
        width: 3
        height: 25
        color: "blue"
        anchors.bottom: zamzam.top
        anchors.left: zamzam.left
        anchors.leftMargin: (zamzam.width / 2) - 1
    }

    Rectangle {
        id: javadiyeh
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.bottom: line3_2.top
        anchors.left: (zamzam.left)
        radius: 180

        Text {
            anchors.left: javadiyeh.left
            anchors.leftMargin: -45
            text: qsTr("Javadiyeh")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_3
        width: 3
        height: 20
        color: "blue"
        anchors.bottom: javadiyeh.top
        anchors.left: javadiyeh.left
        anchors.leftMargin: (javadiyeh.width / 2) - 1
    }

    Rectangle {
        id: rahahan
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.bottom: line3_3.top
        anchors.left: (javadiyeh.left)
        radius: 180

        Text {
            anchors.left: rahahan.left
            anchors.leftMargin: -45
            text: qsTr("Rahahan")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_4
        width: 3
        height: 25
        color: "blue"
        anchors.bottom: rahahan.top
        anchors.left: rahahan.left
        anchors.leftMargin: (rahahan.width / 2) - 1
    }

    Rectangle {
        id: mahdiyeh
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.bottom: line3_4.top
        anchors.left: (rahahan.left)
        radius: 180

        Text {
            anchors.left: mahdiyeh.left
            anchors.leftMargin: -45
            text: qsTr("Mahdiyeh")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_5
        width: 3
        height: 20
        color: "blue"
        anchors.bottom: mahdiyeh.top
        anchors.left: mahdiyeh.left
        anchors.leftMargin: (mahdiyeh.width / 2) - 1
    }

    Rectangle {
        id: moniriyeh
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.bottom: line3_5.top
        anchors.left: (mahdiyeh.left)
        radius: 180

        Text {
            anchors.left: moniriyeh.left
            anchors.leftMargin: -45
            text: qsTr("Moniriyeh")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_6
        width: 3
        height: 20
        color: "blue"
        anchors.bottom: moniriyeh.top
        anchors.top: teatreshahr.bottom
        anchors.left: moniriyeh.left
        anchors.leftMargin: (moniriyeh.width / 2) - 1
    }

    Rectangle {
        id: line3_7
        width: 3
        height: 20
        color: "blue"
        anchors.bottom: teatreshahr.top
        anchors.top: meydanehazratevaliasr.bottom
        anchors.left: teatreshahr.left
        anchors.leftMargin: (teatreshahr.width / 2) - 1
    }

    Rectangle {
        id: meydanehazratevaliasr
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: haftometir.top
        anchors.left: (teatreshahr.left)
        radius: 180

        Text {
            anchors.right: meydanehazratevaliasr.left
            anchors.rightMargin: -5
            anchors.top: meydanehazratevaliasr
            y: -10
            text: qsTr("Meydan-e Hazrat-e Valiasr")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_8
        width: 3
        height: 28
        color: "blue"
        anchors.bottom: meydanehazratevaliasr.top
        anchors.left: meydanehazratevaliasr.left
        anchors.leftMargin: (meydanehazratevaliasr.width / 2) - 1
    }

    Rectangle {
        id: meydanejahad
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.bottom: line3_8.top
        anchors.left: (meydanehazratevaliasr.left)
        radius: 180

        Text {
            anchors.right: meydanejahad.left
            anchors.leftMargin: -40
            text: qsTr("Meydan-e Jahad")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_9
        width: 85
        height: 3
        color: "blue"
        anchors.top: shahidbeheshti.top
        anchors.topMargin: (shahidbeheshti.height / 2) - 1
        anchors.right: shahidbeheshti.left
        // anchors.leftMargin: (shahidbeheshti.width / 2) - 1
    }

    Rectangle {
        id: merzayeshirazi
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: shahidbeheshti.top
        anchors.right: (line3_9.left)
        radius: 180

        Text {
            anchors.right: merzayeshirazi.left
            y: -5
            text: qsTr("Meydan-e Jahad")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_10
        width: 80
        height: 3
        color: "blue"
        anchors.top: merzayeshirazi.top
        anchors.topMargin: (merzayeshirazi.height / 2) - 1
        anchors.right: merzayeshirazi.left
        anchors.left: line3_11.right
        // anchors.leftMargin: (shahidbeheshti.width / 2) - 1
    }

    Rectangle {
        id: line3_11
        width: 3
        height: 18
        color: "blue"
        anchors.bottom: meydanejahad.top
        anchors.left: meydanejahad.left
        anchors.leftMargin: (meydanejahad.width / 2) - 1
    }

    Rectangle {
        id: line3_12
        width: 45
        height: 3
        color: "blue"
        anchors.top: shahidbeheshti.top
        anchors.left: shahidbeheshti.right
        anchors.topMargin: (shahidbeheshti.height / 2) - 1
    }

    Rectangle {
        id: sohrevardi
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: shahidbeheshti.top
        anchors.left: (line3_12.right)
        radius: 180

        Text {
            anchors.bottom: sohrevardi.bottom
            anchors.bottomMargin: -10
            text: qsTr("sohrevardi")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_13
        width: 25
        height: 3
        color: "blue"
        anchors.top: sohrevardi.top
        anchors.left: sohrevardi.right
        anchors.topMargin: (sohrevardi.height / 2) - 1
    }

    Rectangle {
        id: line3_14
        width: 3
        height: 55
        color: "blue"
        anchors.bottom: line3_13.bottom
        anchors.left: line3_13.right
    }

    Rectangle {
        id: line3_15
        width: 25
        height: 3
        color: "blue"
        anchors.top: line3_14.top
        anchors.left: line3_14.right
    }

    Rectangle {
        id: shahidghodousi
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line3_15.top
        anchors.left: (line3_15.right)
        anchors.topMargin: -(shahidghodousi.height / 2) + 1
        radius: 180

        Text {
            anchors.top: shahidghodousi.top
            anchors.topMargin: -15
            text: qsTr("Shahid Ghodousi")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_16
        width: 80
        height: 3
        color: "blue"
        anchors.top: line3_15.top
        anchors.left: shahidghodousi.right
    }

    Rectangle {
        id: shahidzeynodin
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line3_16.top
        anchors.left: (line3_16.right)
        anchors.topMargin: -(shahidghodousi.height / 2) + 1
        radius: 180

        Text {
            anchors.top: shahidzeynodin.top
            anchors.topMargin: 28
            x: -15
            text: qsTr("Shahid Zeynoddin")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_17
        width: 55
        height: 3
        color: "blue"
        anchors.top: line3_16.top
        anchors.left: shahidzeynodin.right
    }

    Rectangle {
        id: aghdasiyeh
        width: 30
        height: 30
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: line3_17.top
        anchors.left: (line3_17.right)
        anchors.topMargin: -(aghdasiyeh.height / 2) + 1
        radius: 180

        Text {
            anchors.top: aghdasiyeh.top
            anchors.topMargin: 28
            text: qsTr("Aghdasiyeh")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_18
        width: 55
        height: 3
        color: "blue"
        anchors.top: line3_16.top
        anchors.left: shahidzeynodin.right
    }

    Rectangle {
        id: ghaem
        width: 35
        height: 35
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: aghdasiyeh.top
        anchors.left: shahidkulahdoz.left
        anchors.leftMargin: -((ghaem.width - aghdasiyeh.width) / 2)
        radius: 180

        Text {
            anchors.top: ghaem.top
            anchors.topMargin: -15
            // anchors.leftMargin: -45
            text: qsTr("Gha'em")
            font.pixelSize: 10
        }

        Text {

            topPadding: 9
            leftPadding: 4
            text: qsTr("Line_3")
            color: "blue"
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line3_19
        // width: 150
        height: 3
        color: "blue"
        anchors.top: line3_16.top
        anchors.left: aghdasiyeh.right
        anchors.right: ghaem.left
    }

    Rectangle {
        id: kouhsar
        width: 35
        height: 35
        border.color: "#AAAAAA"
        border.width: 2
        color: "#EFEFEF"
        anchors.top: kashani.top
        anchors.topMargin: -((ghaem.width - kashani.width) / 2)
        radius: 180

        Text {
            anchors.top: kouhsar.top
            anchors.topMargin: -15
            text: qsTr("Kouhsar")
            font.pixelSize: 10
        }
    }

    Rectangle {
        id: line6_1
        height: 3
        color: "blue"
        anchors.top: kouhsar.top
        anchors.topMargin: (kouhsar.height / 2) - 1
        anchors.left: kouhsar.right
        anchors.right: kashani.left
    }
}
