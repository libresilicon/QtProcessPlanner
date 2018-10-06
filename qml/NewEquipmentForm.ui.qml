import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Page {
    Layout.fillWidth: true
    Layout.fillHeight: true

    title: qsTr("New equipment")

    ColumnLayout {
        id: column
        Layout.fillWidth: true
        Layout.fillHeight: true

        RowLayout {
            id: rowLayout
            Layout.fillWidth: true
            height: 100

            Label {
                id: label
                text: qsTr("Name")
            }

            TextField {
                id: machineName
                width: 160
                height: 30
                text: qsTr("")
                clip: false
                font.pixelSize: 10
                background: Rectangle {
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.width: 2
                    border.color: "black"
                }
            }
        }
    Button {
        id: button
        x: 10
        y: 92
        text: qsTr("Save")
            onClicked: {
			console.log("Miau "+machineName.text)
	    }

    }

    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
