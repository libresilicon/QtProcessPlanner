import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true

	anchors.fill: parent
                ColumnLayout {
                RowLayout {
            	    Layout.fillWidth: true
                    height: 27
                    spacing: 20

                    Label {
                        text: qsTr("Name:")
                        font.pointSize: 10
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: categoryName 
                        width: 160
                        height: 30
                        text: qsTr("")
                        clip: false
                        font.pixelSize: 10
                        background: Rectangle {
                            radius: 2
                            implicitWidth: 100
                            implicitHeight: 24
			    border.width: 2
                            border.color: "black"
                        }
                    }
                }

        Button {
            height: 30
            text: qsTr("Save")
            onClicked: {
			console.log(categoryName.text)
			equipmentCategoryModel.append({
				"name": categoryName.text,
			})
			stackView.pop()
	    }

        }

            }
    }
}
