#include <QTextStream>
#include <QFile>
#include <QUrl>

class FileIO : public QObject {
	Q_OBJECT

public:
	Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
	Q_PROPERTY(QString content READ content WRITE setContent NOTIFY contentChanged)

	Q_INVOKABLE void read();
	Q_INVOKABLE void write();

	QString path();
	QString content();

private:
	QString m_path;
	QString m_content;

public slots:
	void setPath(QString t);
	void setContent(QString t);

signals:
	void pathChanged(QString t);
	void contentChanged(QString t);
};
