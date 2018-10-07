#include <QDebug>
#include <QDir>
#include <QStandardPaths>

#include "fileio.h"

void FileIO::read()
{
	if(m_path.isEmpty()) {
		return;
	}
	QString dataPrefix = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation);
	QString dataBasePath = QDir(dataPrefix).filePath(m_path);



	QFile file(dataBasePath);
	if(!file.exists()) {
		qWarning() << "Does not exits: " << dataBasePath;
		return;
	}
	if(file.open(QIODevice::ReadOnly)) {
		QTextStream stream(&file);
		m_content = stream.readAll();
		emit contentChanged(m_content);
	}
}

void FileIO::write()
{
	if(m_path.isEmpty()) {
		return;
	}
	QString dataPrefix = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation);
	QString dataBasePath = QDir(dataPrefix).filePath(m_path);

	QFile file(dataBasePath);
	if(file.open(QIODevice::WriteOnly)) {
		QTextStream stream(&file);
		stream << m_content;
	}
}

void FileIO::setPath(QString t)
{
	qDebug() << t;
	m_path = t;
}

QString FileIO::path()
{
	return m_path;
}

QString FileIO::content()
{
	return m_content;
}

void FileIO::setContent(QString c)
{
	m_content = c;
}

