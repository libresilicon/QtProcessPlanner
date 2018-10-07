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
#include "fileio_plugin.h"

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	
	QGuiApplication app(argc, argv);
	app.setOrganizationName("LibreSilicon");
	app.setOrganizationDomain("libresilicon.com");
	app.setApplicationName("Process planner");

	QQmlApplicationEngine engine;
	qmlRegisterType<FileIO>("extensions", 1, 0, "FileIO");
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	if (engine.rootObjects().isEmpty())
		return -1;
	
	return app.exec();
}
