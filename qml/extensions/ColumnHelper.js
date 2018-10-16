//import QtQuick 2.3
//import QtQml.Models 2.1
//import QtQuick.Layouts 1.11

var columns = {}

function calcColumnWidths(minw, model, parent)
{
	for (var i = 0; i < model.count; i++)
	{
		var data = model.get(i)
			for (var key in data)
			{
				if (!columns[key]) {
					columns[key] = minw
				}

				var textElement = Qt.createQmlObject(
						'import QtQuick 2.3'
						+ '\n'
						+ 'Text {'
						+ ' text: "' + data[key] + '" '
						+ '}',
						parent, "calcColumnWidths")

				console.log("Before: ("+key+") "+columns[key])
				columns[key] = Math.max(textElement.width, columns[key])
				textElement.destroy()
				console.log("After:  ("+key+") "+columns[key])
			}
	}
	return columns
}
