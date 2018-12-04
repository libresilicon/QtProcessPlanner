import QtQuick 2.4
import QtQuick 2.9
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQml.Models 2.1
import QtQml.Models 2.2
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.11

Page {
	title: qsTr("Flow")
	padding: 20
	ColumnLayout {
		anchors.fill: parent
		Layout.fillWidth: true
		Layout.fillHeight: true
		TreeView {
			id: flowTable
			Layout.fillWidth: true
			Layout.fillHeight: true
			model: flowModel
			selection: ItemSelectionModel {
				model: flowModel
			}
			TableViewColumn {
				role: "name"
				title: "Name"
			}
			TableViewColumn {
				role: "equipment"
				title: "Equipment"
			}
			TableViewColumn {
				role: "description"
				title: "Description"
			}
			Connections {
				target: flowModel 
				onDataChanged: {
					//console.log("QML got data changed signal, row:", topLeft.row, "item:", topLeft.data, "roles:", roles)
				}
			}

		}
		FlowsFormListControls {
			id: flowControls
			Layout.fillWidth: true
			Layout.fillHeight: true
		}
	}
    Connections {
        target: flowTable
        onClicked: {
		flowControls.handleSelection(flowTable.model.getItem(index))
	}
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
