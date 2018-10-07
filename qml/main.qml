import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQml.Models 2.1

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
			getCityJSON()
		}
	}

	ListModel {
		id: equipmentModel
	}

	function getCityJSON() {
		var rawFile = new XMLHttpRequest();
		rawFile.open("GET", "/equipment.json", false);
		rawFile.onreadystatechange = function () {
			if(rawFile.readyState === 4) {
				if(rawFile.status === 200 || rawFile.status == 0) {
					var result = JSON.parse(rawFile.responseText)
					equipmentModel.append({
						"name": result.name + " " + Date(result.dt * 1000),
						"type": result.main.temp
					})
				}
			} else {
				console.log("Oops. Something went wrong when trying to read equipment.json")
			}
		}
		rawFile.send(null);
	}
}



