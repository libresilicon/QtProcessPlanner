import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Page {
	title: qsTr("Home")

	RowLayout {
		id: row
		anchors.centerIn: parent
		Layout.fillWidth: true
		Layout.fillHeight: true

		spacing: 30

		HomeFormActionButton {
			id: showEquipmentButton
			imgURL: "/database.png"
			page: "qrc:/EquipmentForm.ui.qml"
			text: "Equipment"
		}
		HomeFormActionButton {
			id: showFlowsButton
			imgURL: "/flow.png"
			page: "qrc:/FlowsForm.ui.qml"
			text: "Flows"
		}
		HomeFormActionButton {
			id: showRunPageButton
			imgURL: "/run.png"
			page: "qrc:/RunForm.ui.qml"
			text: "Run"
		}
	}

	states: [
		State {
			name: "Home"
		}
	]
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
