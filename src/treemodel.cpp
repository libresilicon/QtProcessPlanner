/*
    treemodel.cpp

    Provides a simple tree model to show how to create and use hierarchical
    models.
*/

#include "treemodel.h"
#include "customtype.h"
#include <QStringList>

#define TOROLE(x) (x-Qt::UserRole-1)
#define FROMROLE(x) (x+Qt::UserRole+1)

TreeModel::TreeModel(QObject *parent) : QAbstractItemModel(parent)
{
	rootItem = new TreeItem();
}

void TreeModel::append(QVariantMap map) {
	QVector<QVariant> data(m_roleNameMapping.count());
	QString name;
	foreach(int i, m_roleNameMapping.keys()) {
		name=m_roleNameMapping[i];
		data[i]=map[name].toString();
	}
	rootItem->appendChild(new TreeItem(data, rootItem));
	emit modelReset();
}

int TreeModel::count()
{
	return (rootItem!=nullptr)?rootItem->childCount():0;
}

TreeItem* TreeModel::get(int index) const
{
	if(rootItem==nullptr) return new TreeItem();
	return rootItem->child(index);
}

void TreeModel::append(TreeItem *node, QVariantMap map)
{
	QVector<QVariant> data(m_roleNameMapping.count());
	QString name;
	foreach(int i, m_roleNameMapping.keys()) {
		name=m_roleNameMapping[i];
		data[i]=map[name].toString();
	}
	node->appendChild(new TreeItem(data, node));
	emit modelReset();
}

void TreeModel::setMapping(int i, QString s)
{
	m_roleNameMapping[i]=s.toUtf8();

	if(rootItem==nullptr) {
		QVector<QVariant> data(m_roleNameMapping.count());
		int j=0;
		foreach(QByteArray v, m_roleNameMapping) {
		       	data[j]=v;
			j++;
		}
		rootItem = new TreeItem(data);
		connect(rootItem, SIGNAL(modelReset()), this, SLOT(onModelReset()));
	} else {
		rootItem->setMapping(i,s);
	}

	emit modelReset();
}

void TreeModel::onModelReset()
{
	emit modelReset();
}

void TreeModel::setJSON(QString json) {
	QJsonDocument jsonData = QJsonDocument::fromJson(json.toUtf8());
	if(jsonData.isArray()) {
		if(rootItem==nullptr) {
			qDebug() << "Error. Root item not initialized!";
		} else {
			QJsonArray flowArray = jsonData.array();
			foreach(QJsonValue o, flowArray) {
				if(o.isObject()) {
					rootItem->appendChild(convertQJsonObjectToTreeItem(rootItem, o.toObject()));
				}
			}
		}
	} else {
		qDebug() << "Error. Content isn't an array!";
	}
	emit modelReset();
}

TreeItem* TreeModel::convertQJsonObjectToTreeItem(TreeItem *parent, QJsonObject o) const
{
	TreeItem *ret; 
	QString name;
	QVector<QVariant> data(m_roleNameMapping.count());
	foreach(int i, m_roleNameMapping.keys()) {
		name=m_roleNameMapping[i];
		data[i]=o[name].toString();
	}

	ret = new TreeItem(data,parent);

	QJsonValue v = o["children"];
	if(v.isArray()) {
		 QJsonArray ar = v.toArray();
		 foreach(QJsonValue val, ar) {
			 if(val.isObject()) {
				ret->appendChild(convertQJsonObjectToTreeItem(ret, val.toObject()));
			 }
		 }
	}

	return ret;
}

QJsonObject TreeModel::convertTreeItemToJSON(TreeItem* item)
{
	QJsonObject flowObject;
	QJsonArray childFlowObjects;
	if(item!=nullptr) {
		for(int i=0; i<item->columnCount(); i++) {
			flowObject.insert(m_roleNameMapping[i], item->data(i).toString());
		}
		if(item->childCount()>0) {
			for(int j=0; j<item->childCount(); j++) {
				childFlowObjects.push_back(convertTreeItemToJSON(item->child(j)));
			}
			flowObject.insert("children",childFlowObjects);
		}
	}
	return flowObject;
}

QString TreeModel::getJSON() {
	QJsonArray o;
	for(int i=0; i<rootItem->childCount(); i++) {
		o.push_back(convertTreeItemToJSON(rootItem->child(i)));
	}
	QJsonDocument doc(o);
	return doc.toJson();
}

TreeModel::~TreeModel()
{
	delete rootItem;
}

int TreeModel::columnCount(const QModelIndex &parent) const
{
	if (parent.isValid())
		return static_cast<TreeItem*>(parent.internalPointer())->columnCount();
	else
		return rootItem->columnCount();
}

QVariant TreeModel::data(const QModelIndex &index, int role) const
{
	if (!index.isValid())
		return QVariant();

	TreeItem *item = static_cast<TreeItem*>(index.internalPointer());

	return item->data(role);
}

Qt::ItemFlags TreeModel::flags(const QModelIndex &index) const
{
	if (!index.isValid())
		return 0;

	return QAbstractItemModel::flags(index);
}

QVariant TreeModel::headerData(int section, Qt::Orientation orientation, int role) const
{
	if (orientation == Qt::Horizontal && role == Qt::DisplayRole)
		return rootItem->data(section);

	return QVariant();
}

QModelIndex TreeModel::index(int row, int column, const QModelIndex &parent) const
{
	if (!hasIndex(row, column, parent))
		return QModelIndex();

	TreeItem *parentItem;

	if (!parent.isValid())
		parentItem = rootItem;
	else
		parentItem = static_cast<TreeItem*>(parent.internalPointer());

	TreeItem *childItem = parentItem->child(row);
	if (childItem)
		return createIndex(row, column, childItem);
	else
		return QModelIndex();
}

QModelIndex TreeModel::parent(const QModelIndex &index) const
{
	if (!index.isValid())
		return QModelIndex();

	TreeItem *childItem = static_cast<TreeItem*>(index.internalPointer());
	TreeItem *parentItem = childItem->parentItem();

	if (parentItem == rootItem)
		return QModelIndex();

	return createIndex(parentItem->row(), 0, parentItem);
}

int TreeModel::rowCount(const QModelIndex &parent) const
{
	TreeItem *parentItem;

	if (parent.column() > 0)
		return 0;

	if (!parent.isValid())
		parentItem = rootItem;
	else
		parentItem = static_cast<TreeItem*>(parent.internalPointer());

	if (parentItem==nullptr)
		return 0;

	return parentItem->childCount();
}

QHash<int, QByteArray> TreeModel::roleNames() const
{
	return m_roleNameMapping;
}

QVariant TreeModel::newCustomType(const QString &text, int position)
{
	CustomType *t = new CustomType(this);
	t->setText(text);
	t->setIndentation(position);
	QVariant v;
	v.setValue(t);
	return v;
}

TreeItem* TreeModel::getItem(const QModelIndex &index) const
{
	if (index.isValid()) {
		TreeItem *item = static_cast<TreeItem*>(index.internalPointer());
		if (item!=nullptr)
			return item;
	}
	return rootItem;
}
