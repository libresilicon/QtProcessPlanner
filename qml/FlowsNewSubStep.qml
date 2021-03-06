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
	}
	ColumnLayout {
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.fill: parent
		spacing: 10
		FlowSubStepDataField {
			id: dataFields
		}
		Button {
			height: 30
			text: qsTr("Save")
			onClicked: {
				var newkey=1;
				while(flowSubStepKeyExists(flow.data(0),newkey)===true) { newkey=newkey+1; }
				var newdata=dataFields.getData()
				newdata["key"]=newkey
				flowModel.append(root.flow,newdata)
				stackView.pop()
			}
		}
	}
}
