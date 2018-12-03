import QtQuick 2.9
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2

Page {
	id: root
	property var flow
	padding: 20
	Component.onCompleted: {
		console.log("Completed Running!")
		console.log(flow)
	}
	ColumnLayout {
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.fill: parent
		spacing: 10
		RowLayout {
			Layout.fillWidth: true
			height: 27
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
		RowLayout {
			Layout.fillWidth: true
			height: 27
			spacing: 20
			Label {
				text: qsTr("Equipment:")
				font.pointSize: 10
				verticalAlignment: Text.AlignVCenter
			}
			ComboBox {
				id: equipmentName
				width: 160
				height: 30
				clip: false
				font.pixelSize: 10
				model: equipmentModel
				textRole : "name" 
				background: Rectangle {
					radius: 2
					implicitWidth: 100
					implicitHeight: 24
					border.width: 2
					border.color: "black"
				}
			}
			ActionButton {
				text : "Add equipment"
				page : "qrc:/NewEquipmentForm.ui.qml"
			}
		}
		Button {
			height: 30
			text: qsTr("Save")
			onClicked: {
				var newkey=1;
				while(flowSubStepKeyExists(flow.dataMember(0),newkey)===true) { newkey=newkey+1; }
				flowModel.append(root.flow,{
					"key": newkey,
					"name": flowStepName.text
				})
				stackView.pop()
			}
		}
	}
}
