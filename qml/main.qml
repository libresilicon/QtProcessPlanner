import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQml.Models 2.1
import Qt.labs.settings 1.0
import extensions 1.0

ApplicationWindow {
	id: window
	visible: true
	width: 640
	height: 480
	title: qsTr("Stack")
	
	header: ToolBar {
		contentHeight: toolButton.implicitHeight
		
		ToolButton {
			id: toolButton
			text: stackView.depth > 1 ? "\u25C0" : "\u2630"
			font.pixelSize: Qt.application.font.pixelSize * 1.6
			onClicked: {
				if (stackView.depth > 1) {
					stackView.pop()
				} else {
					drawer.open()
				}
			}
		}
		
		Label {
			text: stackView.currentItem.title
			anchors.centerIn: parent
		}
	}
	
	Drawer {
		id: drawer
		width: window.width * 0.66
		height: window.height
		
		Column {
			anchors.fill: parent
			
			ItemDelegate {
				text: qsTr("Equipment")
				width: parent.width
				onClicked: {
					stackView.push("equipment.ui.qml")
					drawer.close()
				}
			}
			ItemDelegate {
				text: qsTr("Flows")
				width: parent.width
				onClicked: {
					stackView.push("flows.ui.qml")
					drawer.close()
				}
			}
			ItemDelegate {
				text: qsTr("Run")
				width: parent.width
				onClicked: {
					stackView.push("run.ui.qml")
					drawer.close()
				}
			}
		}
	}

	
	StackView {
		id: stackView
		initialItem: "HomeForm.ui.qml"
		anchors.fill: parent
		Component.onCompleted: {
			jsonDataFile.read()
			var datamodel = JSON.parse(jsonDataFile.content)

			var categoryArray = datamodel["categories"]
			for(var i in categoryArray) {
				equipmentCategoryModel.append({"name": categoryArray[i],})
			}
		}
		Component.onDestruction: {
			var tmpar = {} 

			tmpar["categories"] = []
			for(var i=0; i<equipmentCategoryModel.count; i++) {
				tmpar["categories"].push(equipmentCategoryModel.get(i).name)
			}

			jsonDataFile.content = JSON.stringify(tmpar)
			jsonDataFile.write()
		}
	}

	ListModel {
		id: equipmentModel
	}
	ListModel {
		id: equipmentCategoryModel
	}

	FileIO {
		id: jsonDataFile
		path: "db.json"
	}

}
