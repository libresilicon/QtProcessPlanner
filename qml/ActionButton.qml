import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtPositioning 5.4
import QtQuick.Layouts 1.11

Rectangle {
	id: root
	width: 100
	height: 40
	color: "gray"
	property string text
	property var page
	property var enabled : true

	Button {
		id: button
		text: qsTr(root.text)
		enabled: root.enabled
		onClicked: {
			stackView.push(root.page)
		}
	}
}
