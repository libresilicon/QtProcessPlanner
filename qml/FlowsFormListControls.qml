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
				if (root.page.status===Component.Ready) {
					stackView.push(root.page, {"flow": root.flow})
				}
			}
		}
		enabled: false
	}
	Button {
		id: editSubStepButton
		width: 50 
		height: 25
		text: qsTr("Edit sub-step")
		onClicked: {
			if((root.page!==null)&&(root.flow!==null)) {
				//if (root.page.status===Component.Ready) {
				stackView.push(root.page, {"flow": root.flow})
				//}
			}
		}
		enabled: false
	}
	function handleSelection(o) {
		if(o.column()==1) {
			root.flow = o
			addSubStepButton.text = "Add sub step"
			delete root.page
			root.page = Qt.createComponent("qrc:/FlowsNewSubStep.qml");
		} else if(o.column()==2) {
			root.flow = o
			editSubStepButton.text = "Edit sub step"
			delete root.page
			root.page = Qt.createComponent("qrc:/FlowsEditSubStep.qml");
		}
		addSubStepButton.enabled = (o.column()==1)
		editSubStepButton.enabled = (o.column()==2) 
	}
}

