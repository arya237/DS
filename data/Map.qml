import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

// import QtQuick.Controls.Material
Item {

    property string src: "null"
    property string destiny: "null"

    Rectangle {

        Button {

            Image {
                id: name
                source: "a.png"
            }
            width: 100
            height: 50
            x: 10
            y: 800
        }

        id: root
        anchors.fill: parent

        color: "#FFF8E5"

        DelayButton {

            id: pathBtn
            x: 50
            y: 500
            // checked: true
            text: qsTr("shortest\npath")
            delay: 600
            progress: 0.01

            contentItem: Text {
                text: pathBtn.text
                font: pathBtn.font
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 60
                implicitHeight: 60
                opacity: enabled ? 1 : 0.3
                color: pathBtn.down ? "#a8dadc" : "#457b9d"
                radius: size / 2

                readonly property real size: Math.min(pathBtn.width,
                                                      pathBtn.height)
                width: size
                height: size
                anchors.centerIn: parent

                Canvas {
                    id: pathcanvas
                    anchors.fill: parent

                    Connections {
                        target: pathBtn
                        function onProgressChanged() {
                            pathcanvas.requestPaint()
                        }
                    }

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        ctx.strokeStyle = "white"
                        ctx.lineWidth = parent.size / 20
                        ctx.beginPath()
                        var startAngle = Math.PI / 5 * 3
                        var endAngle = startAngle + pathBtn.progress * Math.PI / 5 * 9
                        ctx.arc(width / 2, height / 2,
                                width / 2 - ctx.lineWidth / 2 - 2,
                                startAngle, endAngle)
                        ctx.stroke()
                    }
                }
            }

            onClicked: {
                if (pathBtn.checked) {
                    console.log(src)
                    console.log(destiny)
                    back.get_input_for_path(src, destiny)
                }
            }
        }

        DelayButton {

            id: costBtn
            x: 50
            y: 600
            // checked: true
            text: qsTr("lowest\ncost")
            delay: 600
            progress: 0.01

            contentItem: Text {
                text: costBtn.text
                font: costBtn.font
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 60
                implicitHeight: 60
                opacity: enabled ? 1 : 0.3
                color: costBtn.down ? "#a8dadc" : "#457b9d"
                radius: size / 2

                readonly property real size: Math.min(costBtn.width,
                                                      costBtn.height)
                width: size
                height: size
                anchors.centerIn: parent

                Canvas {
                    id: costcanvas
                    anchors.fill: parent

                    Connections {
                        target: costBtn
                        function onProgressChanged() {
                            costcanvas.requestPaint()
                        }
                    }

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        ctx.strokeStyle = "white"
                        ctx.lineWidth = parent.size / 20
                        ctx.beginPath()
                        var startAngle = Math.PI / 5 * 3
                        var endAngle = startAngle + costBtn.progress * Math.PI / 5 * 9
                        ctx.arc(width / 2, height / 2,
                                width / 2 - ctx.lineWidth / 2 - 2,
                                startAngle, endAngle)
                        ctx.stroke()
                    }
                }
            }

            onClicked: {
                if (costBtn.checked) {
                    console.log(src)
                    console.log(destiny)
                    back.get_input_for_cost(src, destiny)
                }
            }
        }

        DelayButton {

            id: timeBtn
            x: 50
            y: 700
            // checked: true
            text: qsTr("best\ntime")
            delay: 600
            progress: 0.01

            contentItem: Text {
                text: timeBtn.text
                font: timeBtn.font
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 60
                implicitHeight: 60
                opacity: enabled ? 1 : 0.3
                color: timeBtn.down ? "#a8dadc" : "#457b9d"
                radius: size / 2

                readonly property real size: Math.min(timeBtn.width,
                                                      timeBtn.height)
                width: size
                height: size
                anchors.centerIn: parent

                Canvas {
                    id: timecanvas
                    anchors.fill: parent

                    Connections {
                        target: timeBtn
                        function onProgressChanged() {
                            timecanvas.requestPaint()
                        }
                    }

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        ctx.strokeStyle = "white"
                        ctx.lineWidth = parent.size / 20
                        ctx.beginPath()
                        var startAngle = Math.PI / 5 * 3
                        var endAngle = startAngle + timeBtn.progress * Math.PI / 5 * 9
                        ctx.arc(width / 2, height / 2,
                                width / 2 - ctx.lineWidth / 2 - 2,
                                startAngle, endAngle)
                        ctx.stroke()
                    }
                }
            }

            onClicked: {
                if (timeBtn.checked) {
                    console.log(src)
                    console.log(destiny)
                    back.get_input_for_time(src, destiny)
                }
            }
        }

        RoundButton {
            x: 150
            y: 500

            width: 60
            height: 60
            radius: 180

            Image {
                anchors.centerIn: parent
                id: name1
                source: "a.png"
            }
            onClicked: {
                back.reset()
                pathBtn.checked = false
                costBtn.checked = false
                timeBtn.checked = false
                src = "null"
                destiny = "null"
            }
        }

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
                color: "#fcbf49"
                font.pixelSize: 10
            }

            Text {
                anchors.top: chaharbagh.top
                anchors.topMargin: -15
                anchors.left: chaharbagh.left
                anchors.leftMargin: -10
                text: qsTr("chaharbagh")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"
                    if (src === "null") {

                        src = "Chaharbagh"
                    } else
                        destiny = "Chaharbagh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Chaharbagh", chaharbagh)
            }
        }

        Rectangle {
            id: line4_1
            width: 3
            height: 140
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Kashani"
                    } else
                        destiny = "Kashani"
                }
            }

            Component.onCompleted: {

                back.add_objects("Kashani", kashani)
            }
        }

        Rectangle {
            id: line4_2
            width: 3
            height: 45
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Allameh Jafari"
                    } else
                        destiny = "Allameh Jafari"
                }
            }

            Component.onCompleted: {

                back.add_objects("Allameh Jafari", alamehjafari)
            }
        }

        Rectangle {
            id: line4_3
            width: 3
            height: 40
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Eram-e Sabz"
                    } else
                        destiny = "Eram-e Sabz"
                }
            }

            Component.onCompleted: {

                back.add_objects("Eram-e Sabz", eramesabz)
            }
        }

        Rectangle {
            id: line4_4
            width: 3
            height: 65
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Meydan-e Azadi"
                    } else
                        destiny = "Meydan-e Azadi"
                }
            }

            Component.onCompleted: {

                back.add_objects("Meydan-e Azadi", meydaneazadi)
            }
        }

        Rectangle {
            id: line4_5
            width: 25
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Ostad Mo'in"
                    } else
                        destiny = "Ostad Mo'in"
                }
            }

            Component.onCompleted: {

                back.add_objects("Ostad Mo'in", ostadmoin)
            }
        }

        Rectangle {
            id: line4_6
            width: 25
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shademan"
                    } else
                        destiny = "Shademan"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shademan", shademan)
            }
        }

        Rectangle {
            id: line4_7
            width: 25
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Towhid"
                    } else
                        destiny = "Towhid"
                }
            }

            Component.onCompleted: {

                back.add_objects("Towhid", towhid)
            }
        }

        Rectangle {
            id: line4_8
            width: 80
            height: 3
            color: "#fcbf49"
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
                anchors.bottomMargin: -30
                anchors.left: meydaneenghelab.left
                anchors.leftMargin: -50
                text: qsTr("Meydan-e Enghelab-e Eslami")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Meydan-e Enghelab-e Eslami"
                    } else
                        destiny = "Meydan-e Enghelab-e Eslami"
                }
            }

            Component.onCompleted: {

                back.add_objects("Meydan-e Enghelab-e Eslami", meydaneenghelab)
            }
        }

        Rectangle {
            id: line4_9
            width: 80
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Teatr-e Shahr"
                    } else
                        destiny = "Teatr-e Shahr"
                }
            }

            Component.onCompleted: {

                back.add_objects("Teatr-e Shahr", teatreshahr)
            }
        }

        Rectangle {
            id: line4_10
            width: 65
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Ferdowsi"
                    } else
                        destiny = "Ferdowsi"
                }
            }

            Component.onCompleted: {

                back.add_objects("Ferdowsi", ferdowsi)
            }
        }

        Rectangle {
            id: line4_11
            width: 40
            height: 3
            color: "#fcbf49"
            anchors.top: ferdowsi.top
            anchors.topMargin: ferdowsi.height / 2
            anchors.left: (ferdowsi.right)
        }

        Rectangle {
            id: line4_12
            width: 3
            height: 55
            color: "#fcbf49"
            anchors.top: line4_11.top
            anchors.left: line4_11.right
        }

        Rectangle {
            id: line4_13
            width: 45
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Darvazeh Dowlat"
                    } else
                        destiny = "Darvazeh Dowlat"
                }
            }

            Component.onCompleted: {

                back.add_objects("Darvazeh Dowlat", darvazehdowlat)
            }
        }

        Rectangle {
            id: line4_14
            width: 75
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Darvazeh Shemiran"
                    } else
                        destiny = "Darvazeh Shemiran"
                }
            }

            Component.onCompleted: {

                back.add_objects("Darvazeh Shemiran", darvazehshemiran)
            }
        }

        Rectangle {
            id: line4_15
            width: 40
            height: 3
            color: "#fcbf49"
            anchors.top: darvazehshemiran.top
            anchors.topMargin: darvazehshemiran.height / 2
            anchors.left: (darvazehshemiran.right)
        }

        Rectangle {
            id: line4_16
            width: 3
            height: 35
            color: "#fcbf49"
            anchors.top: line4_15.top
            anchors.left: (line4_15.right)
        }

        Rectangle {
            id: line4_17
            width: 40
            height: 3
            color: "#fcbf49"
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
                anchors.top: parent.top
                y: 30
                x: -80
                text: qsTr("Meydan-e Shohada")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Meydan-e Shohada"
                    } else
                        destiny = "Meydan-e Shohada"
                }
            }

            Component.onCompleted: {

                back.add_objects("Meydan-e Shohada", meydaneshohada)
            }
        }

        Rectangle {
            id: line4_18
            width: 40
            height: 3
            color: "#fcbf49"
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
                x: -35
                text: qsTr("Ebn-e Sina")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Ebn-e Sina"
                    } else
                        destiny = "Ebn-e Sina"
                }
            }

            Component.onCompleted: {

                back.add_objects("Ebn-e Sina", ebnesina)
            }
        }

        Rectangle {
            id: line4_19
            width: 30
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Pirouzi"
                    } else
                        destiny = "Pirouzi"
                }
            }

            Component.onCompleted: {

                back.add_objects("Pirouzi", pirouzi)
            }
        }
        Rectangle {
            id: line4_20
            width: 40
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Nabard"
                    } else
                        destiny = "Nabard"
                }
            }

            Component.onCompleted: {

                back.add_objects("Nabard", nabard)
            }
        }

        Rectangle {
            id: line4_21
            width: 30
            height: 3
            color: "#fcbf49"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Nirou Havaei"
                    } else
                        destiny = "Nirou Havaei"
                }
            }

            Component.onCompleted: {

                back.add_objects("Nirou Havaei", nirohavaei)
            }
        }

        Rectangle {
            id: line4_22
            width: 40
            height: 3
            color: "#fcbf49"
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
                color: "#fcbf49"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahid Kolahdouz"
                    } else
                        destiny = "Shahid Kolahdouz"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Kolahdouz", shahidkulahdoz)
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
                color: "#c9184a"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Tajrish"
                    } else
                        destiny = "Tajrish"
                }
            }

            Component.onCompleted: {

                back.add_objects("Tajrish", tajrish)
            }
        }

        Rectangle {
            id: line1_1
            width: 3
            height: 22
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Gheytariyeh"
                    } else
                        destiny = "Gheytariyeh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Gheytariyeh", gheytariyeh)
            }
        }

        Rectangle {
            id: line1_2
            width: 3
            height: 22
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Gholhak"
                    } else
                        destiny = "Gholhak"
                }
            }

            Component.onCompleted: {

                back.add_objects("Gholhak", golhak)
            }
        }

        Rectangle {
            id: line1_3
            width: 3
            height: 25
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Mirdamad"
                    } else
                        destiny = "Mirdamad"
                }
            }

            Component.onCompleted: {

                back.add_objects("Mirdamad", mirdamad)
            }
        }

        Rectangle {
            id: line1_4
            width: 3
            height: 25
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahid Haghani"
                    } else
                        destiny = "Shahid Haghani"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Haghani", shahidhaghani)
            }
        }

        Rectangle {
            id: line1_5
            width: 3
            height: 15
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahid Beheshti"
                    } else
                        destiny = "Shahid Beheshti"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Beheshti", shahidbeheshti)
            }
        }

        Rectangle {
            id: line1_5_5
            width: 3
            height: 15
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahid Mofatteh"
                    } else
                        destiny = "Shahid Mofatteh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Mofatteh", shahidmofatteh)
            }
        }

        Rectangle {
            id: line1_6
            width: 3
            height: 15
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Haftom-e Tir"
                    } else
                        destiny = "Haftom-e Tir"
                }
            }

            Component.onCompleted: {

                back.add_objects("Haftom-e Tir", haftometir)
            }
        }

        Rectangle {
            id: line1_7
            width: 3
            height: 40
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Taleghani"
                    } else
                        destiny = "Taleghani"
                }
            }

            Component.onCompleted: {

                back.add_objects("Taleghani", talaghani)
            }
        }

        Rectangle {
            id: line1_8
            width: 3
            height: 25
            color: "#c9184a"
            anchors.top: talaghani.bottom
            anchors.left: talaghani.left
            anchors.leftMargin: (talaghani.width / 2) - 2
        }

        Rectangle {
            id: line1_9
            width: 3
            height: 25
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Panzdah-e Khordad"
                    } else
                        destiny = "Panzdah-e Khordad"
                }
            }

            Component.onCompleted: {

                back.add_objects("Panzdah-e Khordad", panzadahekhordad)
            }
        }

        Rectangle {
            id: line1_10
            width: 3
            height: 25
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shoush"
                    } else
                        destiny = "Shoush"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shoush", shoush)
            }
        }

        Rectangle {
            id: line1_11
            width: 3
            height: 20
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Jonoub Terminal"
                    } else
                        destiny = "Jonoub Terminal"
                }
            }

            Component.onCompleted: {

                back.add_objects("Jonoub Terminal", jonoubterminal)
            }
        }

        Rectangle {
            id: line1_12
            width: 3
            height: 20
            color: "#c9184a"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahr-e Rey"
                    } else
                        destiny = "Shahr-e Rey"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahr-e Rey", shahrerey)
            }
        }

        Rectangle {
            id: line1_13
            width: 3
            height: 35
            color: "#c9184a"
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
                color: "#c9184a"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Kahrizak"
                    } else
                        destiny = "Kahrizak"
                }
            }

            Component.onCompleted: {

                back.add_objects("Kahrizak", kahrizak)
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
                color: "#219ebc"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Azadegan"
                    } else
                        destiny = "Azadegan"
                }
            }

            Component.onCompleted: {

                back.add_objects("Azadegan", azadegan)
            }
        }

        Rectangle {
            id: line3_1
            width: 3
            height: 20
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Zamzam"
                    } else
                        destiny = "Zamzam"
                }
            }

            Component.onCompleted: {

                back.add_objects("Zamzam", zamzam)
            }
        }

        Rectangle {
            id: line3_2
            width: 3
            height: 25
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Javadiyeh"
                    } else
                        destiny = "Javadiyeh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Javadiyeh", javadiyeh)
            }
        }

        Rectangle {
            id: line3_3
            width: 3
            height: 20
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Rahahan"
                    } else
                        destiny = "Rahahan"
                }
            }

            Component.onCompleted: {

                back.add_objects("Rahahan", rahahan)
            }
        }

        Rectangle {
            id: line3_4
            width: 3
            height: 25
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Mahdiyeh"
                    } else
                        destiny = "Mahdiyeh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Mahdiyeh", mahdiyeh)
            }
        }

        Rectangle {
            id: line3_5
            width: 3
            height: 20
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Moniriyeh"
                    } else
                        destiny = "Moniriyeh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Moniriyeh", moniriyeh)
            }
        }

        Rectangle {
            id: line3_6
            width: 3
            height: 20
            color: "#219ebc"
            anchors.bottom: moniriyeh.top
            anchors.top: teatreshahr.bottom
            anchors.left: moniriyeh.left
            anchors.leftMargin: (moniriyeh.width / 2) - 1
        }

        Rectangle {
            id: line3_7
            width: 3
            height: 20
            color: "#219ebc"
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
                anchors.right: parent.left
                anchors.rightMargin: -5
                anchors.top: parent.top
                y: -10
                text: qsTr("Meydan-e Hazrat-e Valiasr")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Meydan-e Hazrat-e ValiAsr"
                    } else
                        destiny = "Meydan-e Hazrat-e ValiAsr"
                }
            }

            Component.onCompleted: {

                back.add_objects("Meydan-e Hazrat-e ValiAsr",
                                 meydanehazratevaliasr)
            }
        }

        Rectangle {
            id: line3_8
            width: 3
            height: 28
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Meydan-e Jahad"
                    } else
                        destiny = "Meydan-e Jahad"
                }
            }

            Component.onCompleted: {

                back.add_objects("Meydan-e Jahad", meydanejahad)
            }
        }

        Rectangle {
            id: line3_9
            width: 85
            height: 3
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Merza-ye Shirazi"
                    } else
                        destiny = "Merza-ye Shirazi"
                }
            }

            Component.onCompleted: {

                back.add_objects("Merza-ye Shirazi", merzayeshirazi)
            }
        }

        Rectangle {
            id: line3_10
            width: 80
            height: 3
            color: "#219ebc"
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
            color: "#219ebc"
            anchors.bottom: meydanejahad.top
            anchors.left: meydanejahad.left
            anchors.leftMargin: (meydanejahad.width / 2) - 1
        }

        Rectangle {
            id: line3_12
            width: 45
            height: 3
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Sohrevardi"
                    } else
                        destiny = "Sohrevardi"
                }
            }

            Component.onCompleted: {

                back.add_objects("Sohrevardi", sohrevardi)
            }
        }

        Rectangle {
            id: line3_13
            width: 25
            height: 3
            color: "#219ebc"
            anchors.top: sohrevardi.top
            anchors.left: sohrevardi.right
            anchors.topMargin: (sohrevardi.height / 2) - 1
        }

        Rectangle {
            id: line3_14
            width: 3
            height: 55
            color: "#219ebc"
            anchors.bottom: line3_13.bottom
            anchors.left: line3_13.right
        }

        Rectangle {
            id: line3_15
            width: 25
            height: 3
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahid Ghodousi"
                    } else
                        destiny = "Shahid Ghodousi"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Ghodousi", shahidghodousi)
            }
        }

        Rectangle {
            id: line3_16
            width: 80
            height: 3
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahid Zeynoddin"
                    } else
                        destiny = "Shahid Zeynoddin"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Zeynoddin", shahidzeynodin)
            }
        }

        Rectangle {
            id: line3_17
            width: 55
            height: 3
            color: "#219ebc"
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Aghdasiyeh"
                    } else
                        destiny = "Aghdasiyeh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Aghdasiyeh", aghdasiyeh)
            }
        }

        Rectangle {
            id: line3_18
            width: 55
            height: 3
            color: "#219ebc"
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
                text: qsTr("Gha'em")
                font.pixelSize: 10
            }

            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("Line_3")
                color: "#219ebc"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Gha'em"
                    } else
                        destiny = "Gha'em"
                }
            }

            Component.onCompleted: {

                back.add_objects("Gha'em", ghaem)
            }
        }

        Rectangle {
            id: line3_19
            height: 3
            color: "#219ebc"
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
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("Line_6")
                color: "#FFA3B4"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Kouhsar"
                    } else
                        destiny = "Kouhsar"
                }
            }

            Component.onCompleted: {

                back.add_objects("Kouhsar", kouhsar)
            }
        }

        Rectangle {
            id: line6_1
            height: 3
            color: "#FFA3B4"
            anchors.top: kouhsar.top
            anchors.topMargin: (kouhsar.height / 2) - 1
            anchors.left: kouhsar.right
            anchors.right: kashani.left
        }

        Rectangle {
            id: line6_2
            height: 3
            width: 80
            color: "#FFA3B4"
            anchors.top: kashani.top
            anchors.topMargin: (kashani.height / 2)
            anchors.left: (kashani.right)
        }

        Rectangle {
            id: yadegae_e_emam
            width: 30
            height: 30
            border.color: "#AAAAAA"
            border.width: 2
            color: "#EFEFEF"
            anchors.top: kashani.top
            anchors.left: line6_2.right
            anchors.topMargin: -((yadegae_e_emam.width - kashani.width) / 2)
            radius: 180

            Text {
                anchors.top: yadegae_e_emam.top
                anchors.topMargin: -15
                text: qsTr("Yadegar-e Emam")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Yadegar-e Emam"
                    } else
                        destiny = "Yadegar-e Emam"
                }
            }

            Component.onCompleted: {

                back.add_objects("Yadegar-e Emam", yadegae_e_emam)
            }
        }

        Rectangle {
            id: line6_3
            height: 3
            width: 80
            color: "#FFA3B4"
            anchors.top: yadegae_e_emam.top
            anchors.topMargin: (yadegae_e_emam.height / 2)
            anchors.left: (yadegae_e_emam.right)
        }

        Rectangle {
            id: line6_4
            height: 164
            width: 4
            color: "#FFA3B4"
            anchors.top: line6_3.top
            anchors.left: (line6_3.right)
        }

        Rectangle {
            id: boostanelale
            width: 30
            height: 30
            border.color: "#AAAAAA"
            border.width: 2
            color: "#EFEFEF"
            anchors.top: line6_4.bottom
            anchors.leftMargin: 67
            anchors.left: (yadegae_e_emam.right)
            radius: 180

            Text {
                anchors.top: boostanelale.top
                anchors.topMargin: 30
                text: qsTr("Boostan-e Laleh")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Boostan-e laleh"
                    } else
                        destiny = "Boostan-e laleh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Boostan-e laleh", boostanelale)
            }
        }

        Rectangle {
            id: line6_5
            height: 3
            color: "#FFA3B4"
            anchors.top: boostanelale.top
            anchors.topMargin: (boostanelale.width / 2)
            anchors.left: (boostanelale.right)
            anchors.right: meydanehazratevaliasr.left
        }

        Rectangle {
            id: line6_6
            height: 3
            color: "#FFA3B4"
            anchors.top: meydanehazratevaliasr.top
            anchors.topMargin: (meydanehazratevaliasr.width / 2)
            anchors.left: (meydanehazratevaliasr.right)
            anchors.right: haftometir.left
        }

        Rectangle {
            id: line6_7
            height: 3
            color: "#FFA3B4"
            anchors.top: haftometir.top
            anchors.topMargin: (haftometir.width / 2)
            anchors.left: (haftometir.right)
            anchors.right: line6_8.left
        }

        Rectangle {
            id: line6_8
            height: 90
            width: 3
            color: "#FFA3B4"
            anchors.bottom: meydaneshohada.top
            anchors.rightMargin: (meydaneshohada.width / 2) - 1.5
            anchors.right: (meydaneshohada.right)
        }

        Rectangle {
            id: emamhossein
            width: 30
            height: 30
            border.color: "#AAAAAA"
            border.width: 2
            color: "#EFEFEF"
            anchors.bottom: line6_8.top
            anchors.right: (meydaneshohada.right)
            radius: 180

            Text {
                anchors.top: parent.top
                anchors.topMargin: 40
                anchors.left: parent.right
                anchors.leftMargin: 2
                text: qsTr("Emam Hossein")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Emam Hossein"
                    } else
                        destiny = "Emam Hossein"
                }
            }

            Component.onCompleted: {

                back.add_objects("Emam Hossein", emamhossein)
            }
        }
        Rectangle {
            id: line6_9
            height: 16
            width: 3
            color: "#FFA3B4"
            anchors.bottom: emamhossein.top
            anchors.leftMargin: (emamhossein.width / 2) - 1.5
            anchors.left: (emamhossein.left)
        }

        Rectangle {
            id: line6_10
            height: 100
            width: 3
            color: "#FFA3B4"
            anchors.top: meydaneshohada.bottom
            anchors.leftMargin: (meydaneshohada.width / 2) - 1.5
            anchors.left: (meydaneshohada.left)
        }

        Rectangle {
            id: shahidrezaei
            width: 30
            height: 30
            border.color: "#AAAAAA"
            border.width: 2
            color: "#EFEFEF"
            anchors.top: line6_10.bottom
            anchors.right: (meydaneshohada.right)
            radius: 180

            Text {
                anchors.left: shahidrezaei.right
                anchors.leftMargin: 2
                text: qsTr("Shahid Rezaei")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Shahid Rezaei"
                    } else
                        destiny = "Shahid Rezaei"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Rezaei", shahidrezaei)
            }
        }
        Rectangle {
            id: line6_11
            height: 95
            width: 3
            color: "#FFA3B4"
            anchors.top: shahidrezaei.bottom
            anchors.leftMargin: (shahidrezaei.width / 2) - 1.5
            anchors.left: (shahidrezaei.left)
        }

        Rectangle {
            id: line6_12
            height: 3
            width: 315
            color: "#FFA3B4"
            anchors.top: line6_11.bottom
            anchors.left: (line6_11.left)
        }
        Rectangle {
            id: haramehazrateabdolazim
            width: 35
            height: 35
            border.color: "#AAAAAA"
            border.width: 2
            color: "#EFEFEF"
            anchors.top: kahrizak.top
            anchors.left: ghaem.left
            anchors.topMargin: -((ghaem.width - kashani.width) / 2)
            radius: 180

            Text {
                anchors.top: haramehazrateabdolazim.top
                anchors.topMargin: -15
                anchors.left: haramehazrateabdolazim.left
                anchors.leftMargin: -40
                text: qsTr("Haram-e Hazrat-e Abdolazim")
                font.pixelSize: 10
            }
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("Line_6")
                color: "#FFA3B4"
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#EFEFEF") ? "#546E7A" : "#EFEFEF"

                    if (src === "null") {

                        src = "Haram-e Hazrat-e Abdolazim"
                    } else
                        destiny = "Haram-e Hazrat-e Abdolazim"
                }
            }

            Component.onCompleted: {

                back.add_objects("Haram-e Hazrat-e Abdolazim",
                                 haramehazrateabdolazim)
            }
        }

        Rectangle {
            id: bimeh
            objectName: "bus"
            width: 35
            height: 35
            border.color: "#94d2bd"
            border.width: 2
            color: "#94d2bd"
            anchors.top: meydaneazadi.top
            anchors.left: kouhsar.left
            anchors.topMargin: -((ghaem.height - meydaneazadi.height) / 2)
            radius: 180

            Text {
                anchors.top: bimeh.top
                anchors.topMargin: -15
                text: qsTr("Bimeh")
                font.pixelSize: 10
            }
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("BUS 1")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#94d2bd") ? "#546E7A" : "#94d2bd"

                    if (src === "null") {

                        src = "Bimeh"
                    } else
                        destiny = "Bimeh"
                }
            }

            Component.onCompleted: {

                back.add_objects("Bimeh", bimeh)
            }
        }

        Rectangle {
            id: tehranpars
            objectName: "bus"
            width: 35
            height: 35
            border.color: "#94d2bd"
            border.width: 2
            color: "#94d2bd"
            anchors.top: shahidkulahdoz.bottom
            anchors.topMargin: 50
            anchors.left: ghaem.left
            radius: 180

            Text {
                anchors.left: tehranpars.right
                anchors.leftMargin: 5
                y: 10
                text: qsTr("Tehran Pars")
                font.pixelSize: 10
            }
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("BUS 1")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#94d2bd") ? "#546E7A" : "#94d2bd"

                    if (src === "null") {

                        src = "Tehran Pars"
                    } else
                        destiny = "Tehran Pars"
                }
            }

            Component.onCompleted: {

                back.add_objects("Tehran Pars", tehranpars)
            }
        }

        Shape {
            anchors.left: bimeh.right
            anchors.top: bimeh.top
            anchors.topMargin: (bimeh.height / 2) + 1

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 1
                startY: 0
                PathLine {
                    x: 143
                    y: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 153
                startY: 16
                PathLine {
                    relativeX: 0
                    relativeY: 9
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 153
                startY: 24
                PathLine {
                    relativeX: 57
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 208
                startY: 24
                PathLine {
                    relativeX: 0
                    relativeY: -15
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 208
                startY: 24
                PathLine {
                    relativeX: 225
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 428
                startY: 24
                PathLine {
                    relativeX: 0
                    relativeY: -15
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 428
                startY: 24
                PathLine {
                    relativeX: 205
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 632
                startY: 24
                PathLine {
                    relativeX: 0
                    relativeY: -15
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 632
                startY: 24
                PathLine {
                    relativeX: 0
                    relativeY: 55
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 632
                startY: 79
                PathLine {
                    relativeX: 115
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 747
                startY: 79
                PathLine {
                    relativeX: 0
                    relativeY: -10
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 762
                startY: 56
                PathLine {
                    relativeX: 40
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 762
                startY: 56
                PathLine {
                    relativeX: 40
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 802
                startY: 56
                PathLine {
                    relativeX: 0
                    relativeY: -85
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 802
                startY: -31
                PathLine {
                    relativeX: 150
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 980
                startY: -31
                PathLine {
                    relativeX: 50
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 1033
                startY: -31
                PathLine {
                    relativeX: 0
                    relativeY: 110
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 1033
                startY: 105
                PathLine {
                    relativeX: 0
                    relativeY: 70
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#3B8836"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 1033
                startY: 175
                PathLine {
                    relativeX: 245
                    relativeY: 0
                }
            }
        }

        Rectangle {
            id: payanehjavanmard
            objectName: "bus"
            width: 35
            height: 35
            border.color: "#94d2bd"
            border.width: 2
            color: "#94d2bd"
            anchors.top: kahrizak.top
            anchors.left: darvazehshemiran.left
            radius: 180

            Text {
                anchors.left: payanehjavanmard.right
                anchors.leftMargin: 5
                y: 10
                text: qsTr("Payaneh Javanmard")
                font.pixelSize: 10
            }
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("BUS 2")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#94d2bd") ? "#546E7A" : "#94d2bd"

                    if (src === "null") {

                        src = "Payaneh Javanmard"
                    } else
                        destiny = "Payaneh Javanmard"
                }
            }

            Component.onCompleted: {

                back.add_objects("Payaneh Javanmard", payanehjavanmard)
            }
        }

        Rectangle {
            id: khajehabdolah
            objectName: "bus"
            width: 35
            height: 35
            border.color: "#94d2bd"
            border.width: 2
            color: "#94d2bd"
            anchors.bottom: ghaem.top
            anchors.bottomMargin: 43.5
            anchors.left: shahidzeynodin.left
            anchors.leftMargin: -40
            radius: 180

            Text {
                anchors.bottom: khajehabdolah.top
                x: -40
                text: qsTr("Khajeh Abdolah-e Ansari")
                font.pixelSize: 10
            }
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("BUS 2")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#94d2bd") ? "#546E7A" : "#94d2bd"

                    if (src === "null") {

                        src = "Khajeh Abdollah-e Ansari"
                    } else
                        destiny = "Khajeh Abdollah-e Ansari"
                }
            }

            Component.onCompleted: {

                back.add_objects("Khajeh Abdollah-e Ansari", khajehabdolah)
            }
        }

        Shape {
            anchors.left: payanehjavanmard.left
            anchors.leftMargin: (payanehjavanmard.height / 2) + 1
            anchors.bottom: payanehjavanmard.top

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 0
                startY: 0

                PathLine {
                    relativeX: 0
                    relativeY: -95
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 0
                startY: -95

                PathLine {
                    relativeX: 95
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 120
                startY: -95

                PathLine {
                    relativeX: 117.5
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 237.5
                startY: -95

                PathLine {
                    relativeX: 0
                    relativeY: -115
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 237.5
                startY: -240

                PathLine {
                    relativeX: 0
                    relativeY: -130
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 237.5
                startY: -370

                PathLine {
                    relativeX: 200
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 437.5
                startY: -370

                PathLine {
                    relativeX: 0
                    relativeY: -130
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 437.5
                startY: -535

                PathLine {
                    relativeX: 0
                    relativeY: -60
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "#87873D"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 437.5
                startY: -595

                PathLine {
                    relativeX: -300
                    relativeY: 0
                }
            }
        }

        Rectangle {
            id: shahidsadr
            objectName: "bus"
            width: 35
            height: 35
            border.color: "#94d2bd"
            border.width: 2
            color: "#94d2bd"
            anchors.top: gheytariyeh.top
            anchors.topMargin: 30
            anchors.left: merzayeshirazi.left
            anchors.leftMargin: -30
            radius: 180

            Text {
                anchors.top: shahidsadr.top
                anchors.topMargin: 12.5
                anchors.right: shahidsadr.left
                anchors.rightMargin: 10
                text: qsTr("Shahid Sadr")
                font.pixelSize: 10
            }
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("BUS 3")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#94d2bd") ? "#546E7A" : "#94d2bd"

                    if (src === "null") {

                        src = "Shahid Sadr"
                    } else
                        destiny = "Shahid Sadr"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahid Sadr", shahidsadr)
            }
        }

        Rectangle {
            id: shahrakeshariati
            objectName: "bus"
            width: 35
            height: 35
            border.color: "#94d2bd"
            border.width: 2
            color: "#94d2bd"
            anchors.top: azadegan.top
            anchors.left: meydaneenghelab.left
            anchors.leftMargin: -7.5
            radius: 180

            Text {
                anchors.top: shahrakeshariati.top
                anchors.topMargin: 12.5
                anchors.right: shahrakeshariati.left
                anchors.rightMargin: 10
                text: qsTr("Shahrak-e Shari'ati")
                font.pixelSize: 10
            }
            Text {

                topPadding: 9
                leftPadding: 4
                text: qsTr("BUS 3")
                font.pixelSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = Qt.colorEqual(
                                parent.color, "#94d2bd") ? "#546E7A" : "#94d2bd"

                    if (src === "null") {

                        src = "Shahrak-e Shari'ati"
                    } else
                        destiny = "Shahrak-e Shari'ati"
                }
            }

            Component.onCompleted: {

                back.add_objects("Shahrak-e Shari'ati", shahrakeshariati)
            }
        }

        Shape {
            anchors.bottom: shahidsadr.top
            anchors.left: shahidsadr.left
            anchors.leftMargin: (shahidsadr.width / 2) + 1

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 0
                startY: 0
                PathLine {
                    relativeX: 0
                    relativeY: -70
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 0
                startY: -70
                PathLine {
                    relativeX: 125
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 160
                startY: -70
                PathLine {
                    relativeX: 50
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 210
                startY: -70
                PathLine {
                    relativeX: 0
                    relativeY: 162.5
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 210
                startY: 92.5
                PathLine {
                    relativeX: -57
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 210
                startY: 92.5
                PathLine {
                    relativeX: -57
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: 125
                startY: 92.5
                PathLine {
                    relativeX: -325
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: -200
                startY: 92.5
                PathLine {
                    relativeX: 0
                    relativeY: 191
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: -200
                startY: 283.5
                PathLine {
                    relativeX: 120
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: -50
                startY: 283.5
                PathLine {
                    relativeX: 30
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: -20
                startY: 283.5
                PathLine {
                    relativeX: 0
                    relativeY: 235
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: -20
                startY: 518.5
                PathLine {
                    relativeX: -40
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: -82.5
                startY: 518.5
                PathLine {
                    relativeX: -100
                    relativeY: 0
                }
            }

            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                strokeStyle: ShapePath.DashLine
                dashPattern: [1, 3]
                startX: -182.5
                startY: 518.5
                PathLine {
                    relativeX: 0
                    relativeY: 142.5
                }
            }
        }
    }
}
