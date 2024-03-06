import QtQuick
import QtQuick.Controls

ApplicationWindow {

    id: root
    width: 1920
    height: 1080
    visible: true

    Image {
        id: background
        source: "back.png"
    }

    title: qsTr("Hello World")

    Button {
        id: startBtn

        // anchors.centerIn: parent
        visible: enabled
        enabled: true
        width: 200
        height: 50

        Text {
            text: qsTr("Start")
            font.family: "Algerian"
            font.pixelSize: 20
            anchors.centerIn: parent
        }

        background: Rectangle {

            color: "#4DB6AC"
        }

        x: 685
        y: 710
        onClicked: {

            // var component = Qt.createComponent("Map.qml")
            // var window = component.createObject(root)
            // window.show()
            startBtn.enabled = false
            map.enabled = true
        }
    }

    Image {

        x: 125
        width: 1300

        id: logo
        source: "logo.png"
    }

    Loader {
        id: map
        anchors.fill: parent
        source: "Map.qml"
        visible: enabled
        enabled: false
    }
}
