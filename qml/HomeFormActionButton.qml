import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Rectangle {
	id: root
	width: 100
	height: 120
	color: "gray"
	property string text
	property string page
	property string imgURL
	Button {
		width: 100
		height: 120

		text: qsTr("")
		checkable: false
		antialiasing: true
		ColumnLayout {
			Layout.fillWidth: true
			Layout.fillHeight: true
			Rectangle {
				width: 100
				height: 100
				color: "gray"
				Image {
					width: 100
					height: 100
					source: root.imgURL
				}
			}
			Rectangle {
				width: 100
				height: 20
				color: "gray"
				Text {
					id: text1
					width: 100
					text: qsTr(root.text)
					horizontalAlignment: Text.AlignHCenter
					font.bold: true
					font.pixelSize: 14
				}
			}
		}
		onClicked: {
			stackView.push(root.page)
		}
	}
}
/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
