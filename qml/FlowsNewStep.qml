import QtQuick 2.9
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2

Page {
	padding: 20
	ColumnLayout {
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.fill: parent
		spacing: 10
		RowLayout {
			Layout.fillWidth: true
			spacing: 20
			Label {
				text: qsTr("Name:")
				font.pointSize: 10
				verticalAlignment: Text.AlignVCenter
			}
			TextField {
				id: flowStepName 
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
			height: 30
			text: qsTr("Save")
			onClicked: {
				var newkey=1;
				while(flowStepKeyExists(newkey)===true) { newkey=newkey+1; }
				flowModel.append({
					"key": newkey,
					"name": flowStepName.text,
				})
				stackView.pop()
			}
		}
	}
}
