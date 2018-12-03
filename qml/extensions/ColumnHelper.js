function calcColumnWidths(minw, model, parent) {
	var key
	var columns = {}
	for (var i = 0; i < model.count; i++) {
		var data = model.get(i)
		for (key in data) {
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

			columns[key] = Math.max(textElement.width, columns[key])
			textElement.destroy()
		}
	}
	return columns
}
