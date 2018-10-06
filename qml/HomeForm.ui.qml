import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 600
    height: 400
    property alias image: image
    property alias button: button

    title: qsTr("Home")

    Button {
        id: button
        width: 144
        height: 151
        text: qsTr("")
        spacing: 7
        checkable: false
        antialiasing: true
        x: 63
        y: 102
        Image {
            id: image
            x: 20
            y: 12
            width: 100
            height: 100
            source: "/database.png"
        }
        Text {
            id: text1
            x: 20
            y: 123
            width: 100
            height: 20
            text: qsTr("Equipment")
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 14
        }
	onClicked: {
		stackView.push("EquipmentForm.ui.qml")
	}
    }

    Button {
        id: button1
        x: 228
        y: 102
        width: 144
        height: 151
        text: qsTr("")
        antialiasing: true
        Image {
            id: image1
            x: 20
            y: 12
            width: 100
            height: 100
            source: "/flow.png"
        }

        Text {
            id: text2
            x: 20
            y: 123
            width: 100
            height: 20
            text: qsTr("Flows")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
            font.bold: true
        }
	onClicked: {
		stackView.push("FlowsForm.ui.qml")
	}
        checkable: false
        spacing: 7
    }

    Button {
        id: button2
        x: 395
        y: 102
        width: 144
        height: 151
        text: qsTr("")
        checkable: false
        antialiasing: true
        spacing: 7
        Image {
            id: image2
            x: 20
            y: 12
            width: 100
            height: 100
            source: "/run.png"
        }
        Text {
            id: text3
            x: 20
            y: 123
            width: 100
            height: 20
            text: qsTr("Run")
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 14
        }
	onClicked: {
		stackView.push("RunForm.ui.qml")
	}
    }
}

/*##^## Designer {
    D{i:1;anchors_height:137;anchors_y:102}D{i:4;anchors_height:137;anchors_y:102}D{i:7;anchors_height:137;anchors_y:102}
}
 ##^##*/
