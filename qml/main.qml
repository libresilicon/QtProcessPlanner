import QtQuick 2.9
import QtQml.Models 2.2
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.11
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3

import extensions 1.0

ApplicationWindow {
	id: window
	width: 640
	height: 480
	visible: true
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
		RowLayout {
			anchors.centerIn: parent
			Label {
				text: stackView.currentItem.title
			}
			ToolButton {
				icon.source: "document-save.png"
				icon.color: "transparent" 
				visible: ((stackView.depth===2)&&((stackView.currentItem.title==="Equipment")||(stackView.currentItem.title==="Flow")))
				onClicked: {
					if(stackView.currentItem.title==="Equipment") {
						saveMachines("equipment.json")
					} else if(stackView.currentItem.title==="Flow") {
						saveFlow("flow.json")
					}
				}
			}
			ToolButton {
				icon.source: "document-open-folder.png"
				icon.color: "transparent" 
				visible: (stackView.depth===2)
				onClicked: {
					fileOpenDialog.open()
				}
				FileDialog {
					id: fileOpenDialog
					title: qsTr("Open file")
					onAccepted: {
						Qt.quit()
						/*if(stackView.currentItem.title==="Equipment") {
							console.log(fileDialog.fileUrls)
						} else if(stackView.currentItem.title==="Flow") {
						}*/
					}
					nameFilters: [ "JSON files (*.json)", "All files (*)" ]
				}
			}
			ToolButton {
				icon.source: "document-save-as.png"
				icon.color: "transparent" 
				visible: ((stackView.depth===2)&&((stackView.currentItem.title==="Equipment")||(stackView.currentItem.title==="Flow")))
				onClicked: {
					fileSaveAsDialog.open()
				}
				FileDialog {
					id: fileSaveAsDialog
					title: qsTr("Save file")
					onAccepted: {
						Qt.quit()
					}
					nameFilters: [ "JSON files (*.json)", "All files (*)" ]
				}
			}
		}
	}
	Drawer {
		id: drawer
		y: header.height
		width: window.width * 0.3
		height: window.height - header.height
		Column {
			anchors.centerIn: parent
			Layout.fillWidth: true
			Layout.fillHeight: true
			ItemDelegate {
				text: qsTr("Equipment")
				onClicked: {
					stackView.push("qrc:/EquipmentForm.ui.qml")
					drawer.close()
				}
			}
			ItemDelegate {
				text: qsTr("Flows")
				onClicked: {
					stackView.push("qrc:/FlowsForm.ui.qml")
					drawer.close()
				}
			}
			ItemDelegate {
				text: qsTr("Run")
				onClicked: {
					stackView.push("qrc:/RunForm.ui.qml")
					drawer.close()
				}
			}
		}
	}
	StackView {
		id: stackView
		initialItem: "qrc:/HomeForm.ui.qml"
		anchors.fill: parent
		Layout.fillWidth: true
		Layout.fillHeight: true
		Component.onCompleted: {
			readFlow("flow.json")
			readMachines("equipment.json")
		}
		Component.onDestruction: {
			saveFlow("flow.json")
			saveMachines("equipment.json")
		}
	}
	ListModel {
		id: equipmentModel
	}
	ListModel {
		id: equipmentCategoryModel
	}
	ListModel {
		id: equipmentLocationModel
	}
	TreeModel {
		id: flowModel
	}
	ItemSelectionModel {
		id: flowModelSelection
		model: flowModel
	}
	FileIO {
		id: dataFile
	}
	function equipmentKeyExists(i) {
		for(var j = 0; j < equipmentModel.count; j++) {
			var equipmenElement = equipmentModel.get(j)
			var key = equipmenElement['key']
			if(i===key) return true;
		}
		return false
	}
	function getEquipmentFromKey(i) {
		for(var j = 0; j < equipmentModel.count; j++) {
			var equipmenElement = equipmentModel.get(j)
			var key = equipmenElement['key']
			if(i===key) { return equipmenElement }
		}
		return null;
	}
	function flowStepKeyExists(i) {
		for(var j = 0; j < flowModel.count(); j++) {
			var flowElement = flowModel.get(j)
			var key = parseInt(flowElement.data(0))
			if(i===key) return true;
		}
		return false
	}
	function flowSubStepKeyExists(pk,i) {
		var j
		var k
		var key
		var flowElement 
		var subKey
		var flowSubElement 
		var flowSubSteps
		for(j = 0; j < flowModel.count(); j++) {
			flowElement = flowModel.get(j)
			key = parseInt(flowElement.data(0))
			if(parseInt(pk)===key) {
				for(k=0; k<flowElement.childCount(); k++) {
					flowSubElement = flowElement.child(k)
					subKey = parseInt(flowSubElement.data(0))
					if(i===subKey) { return true }
				}
			}
		}
		return false
	}
	function readMachines(fileName) {
		dataFile.path=fileName

		dataFile.read()
		var i = 0
		var c = 0
		var subStepArray
		var subStepEntry
		var datamodel = JSON.parse(dataFile.content)
		var flowArray = datamodel["flow"]

		var categoryArray = datamodel["categories"]
		for(i in categoryArray) {
			equipmentCategoryModel.append({"name": categoryArray[i],})
		}
		var locationArray = datamodel["location"]
		for(i in locationArray) {
			equipmentLocationModel.append({"name": locationArray[i],})
		}
		var equipmentArray = datamodel["equipment"]
		for(i in equipmentArray) {
			var equipmentEntry = equipmentArray[i]
			equipmentModel.append({
				key : equipmentEntry['key'],
				shortname : equipmentEntry['shortname'],
				name : equipmentEntry['name'],
				category : equipmentEntry['category'],
				location : equipmentEntry['location'],
			})
		}

	}
	function saveMachines(fileName) {
		dataFile.path=fileName
		var i
		var j
		var obj
		var substp
		var tmpobj 
		var tmpar = {"categories":[],"equipment":[],"location":[],flow:[]}
		for(i = 0; i < equipmentCategoryModel.count; i++) {
			tmpar["categories"].push(equipmentCategoryModel.get(i).name)
		}
		for(i = 0; i < equipmentLocationModel.count; i++) {
			tmpar["location"].push(equipmentLocationModel.get(i).name)
		}
		for(i = 0; i < equipmentModel.count; i++) {
			var equipmenElement = equipmentModel.get(i)
			var equipmentEntry = {
				key : equipmenElement.key,
				shortname : equipmenElement.shortname,
				name : equipmenElement.name,
				category : equipmenElement.category,
				location : equipmenElement.location,
			}
			tmpar["equipment"].push(equipmentEntry)
		}
		dataFile.content = JSON.stringify(tmpar)
		dataFile.write()
	}
	function readFlow(fileName) {
		dataFile.path = fileName
		dataFile.read()
		flowModel.setMapping(0,"key")
		flowModel.setMapping(1,"name")
		flowModel.setMapping(2,"equipment")
		flowModel.setMapping(3,"description")
		flowModel.setJSON(dataFile.content)
	}
	function saveFlow(fileName) {
		dataFile.path = fileName
		dataFile.content = flowModel.getJSON()
		dataFile.write()
	}
}

