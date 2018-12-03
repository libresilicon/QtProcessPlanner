import QtQuick 2.9
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2

	
RowLayout {
	id: root

	Layout.fillWidth: true
	Layout.fillHeight: true

	//property int key
	property var page: null
	property var flow: null

	spacing: 4
	ActionButton {
		text: "Add step"
		page: "qrc:/FlowsNewStep.qml"
	}
	Button {
		id: addSubStepButton
		width: 50 
		height: 25
		text: qsTr("Add sub-step")
		onClicked: {
			if((root.page!==null)&&(root.flow!==null)) {
				if (page.status===Component.Ready) {
					stackView.push(root.page, {"flow": root.flow})
				}
			}
		}
	}
	function handleSelection(o) {
		root.flow = o 
		addSubStepButton.text = "Add sub-step to "+o.dataMember(1)
		delete root.page
		root.page = Qt.createComponent("qrc:/FlowsNewSubStep.qml");
		addSubStepButton.enabled =  true
	}
}

