import QtQuick
import QtQuick.Controls
import QtQuick.Window

ApplicationWindow {

    id: root
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")

    Button {
        id: startBtn
        width: 100
        height: 50
        visible: enabled
        enabled: true
        x: 50
        y: 10
        onClicked: {

            // var component = Qt.createComponent("Map.qml")
            // var window = component.createObject(root)
            // window.show()
            startBtn.enabled = false
            map.enabled = true
        }
    }
    Image {
        id:a
        source: "a.png"
    }
    Loader {
        id: map
        anchors.fill: parent
        source: "Map.qml"
        visible: enabled
        enabled: false
    }
}
