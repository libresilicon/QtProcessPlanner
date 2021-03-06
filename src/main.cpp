#include <QDebug>
#include <QFile>
#include <QFileInfo>
#include <QDir>
#include <QTextStream>
#include <QStandardPaths>
#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlProperty>

#include "fileio.h"
//#include "fileio_plugin.h"
#include "customtype.h"
#include "treemodel.h" 
//#include "treemodel_plugin.h" 

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	
	QGuiApplication app(argc, argv);
	app.setOrganizationName("LibreSilicon");
	app.setOrganizationDomain("libresilicon.com");
	app.setApplicationName("Process planner");

	QQmlApplicationEngine engine;
	qmlRegisterType<FileIO>("extensions", 1, 0, "FileIO");
	qmlRegisterType<CustomType>("extensions", 1, 0, "CustomType");
	qmlRegisterType<TreeModel>("extensions", 1, 0, "TreeModel");
	qmlRegisterType<TreeItem>("extensions", 1, 0, "TreeItem");
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	if (engine.rootObjects().isEmpty())
		return -1;
	
	return app.exec();
}
