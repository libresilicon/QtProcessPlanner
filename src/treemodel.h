#ifndef TREEMODEL_H
#define TREEMODEL_H

#include <QAbstractItemModel>
#include <QModelIndex>
#include <QVariant>
#include <QDebug>
#include <QMap>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include "treeitem.h"

class TreeModel : public QAbstractItemModel
{
	Q_OBJECT

	public:
		explicit TreeModel(QObject *parent = 0);
		~TreeModel();

		/* QAbstractItemModel interface */
		QVariant data(const QModelIndex &index, int role) const Q_DECL_OVERRIDE;
		Qt::ItemFlags flags(const QModelIndex &index) const Q_DECL_OVERRIDE;
		QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;
		QModelIndex index(int row, int column, const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
		QModelIndex parent(const QModelIndex &index) const Q_DECL_OVERRIDE;
		int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
		int columnCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
		QHash<int, QByteArray> roleNames() const override;

		// functions to fill the tree from QML
		Q_INVOKABLE void setMapping(int,QString); 
		Q_INVOKABLE void append(QVariantMap map);
		Q_INVOKABLE void append(TreeItem *node, QVariantMap map);
		Q_INVOKABLE void setJSON(QString json);
		// functions to read the tree from QML
		Q_INVOKABLE int count();
		Q_INVOKABLE TreeItem* get(int index) const;
		Q_INVOKABLE QString getJSON();
		Q_INVOKABLE TreeItem* getItem(const QModelIndex &index) const;

	signals:
		void modelReset();

	public slots:
		void onModelReset();

	private:
		QVariant newCustomType(const QString &text, int position);
		QJsonObject convertTreeItemToJSON(TreeItem* item);
		TreeItem* convertQJsonObjectToTreeItem(TreeItem *parent, QJsonObject o) const;

		TreeItem *rootItem;
		QHash<int, QByteArray> m_roleNameMapping;
};

#endif // TREEMODEL_H
