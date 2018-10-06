import QtQuick 2.3
import QtQml.Models 2.1

Rectangle {
	width: 400
	height: 200

	ListModel {
		id: equipmentModel
	}

	ListView {
		anchors.fill: parent
		model: equipmentModel
		delegate: equipmentDelegate
	}

	Component {
		id: equipmentDelegate

		Rectangle {
			id: content

			anchors { left: parent.left; right: parent.right }
			height: 40
			width: 40
			border.width: 2
			border.color: "black"
			radius: 2
			
			Row {
				spacing: 10
				Text {
					text: name
					width: 100
				}
				Text { text: type }
			}
		}
	}
	Component.onCompleted: {
		getCityJSON()
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
				equipmentModel.append({
					"name": "New machine",
					"type": "Select type"
				})
			}
		}
		rawFile.send(null);

		//JSON.parse(json);
		/*if(fileUtils.existsFile("/equipment.json")) {
			var documentsData = fileUtils.readFile("subfolder/file.json")
			equipmentModel.append({
				"name": result.name + " " + Date(result.dt * 1000),
				"temp": result.main.temp
			})
		} else {
			console.log("Oops. Something went terribly wrong. The equipment database doesn't exist.")
		}*/
	}
}

