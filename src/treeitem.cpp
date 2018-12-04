/*
    treeitem.cpp

    A container for items of data supplied by the simple tree model.
*/

#include <QStringList>
#include "treeitem.h"

TreeItem::TreeItem(const QList<QVariant> &data, TreeItem *parent)
{
	m_parentItem = parent;
	m_itemData = data;
}

TreeItem::TreeItem()
{
	m_parentItem = nullptr;
}

TreeItem::~TreeItem()
{
	qDeleteAll(m_childItems);
}

void TreeItem::appendChild(TreeItem *item)
{
	m_childItems.append(item);
	connect(item, SIGNAL(modelReset), this, SLOT(onModelReset));
	emit modelReset();
}

void TreeItem::setData(int i, QString s)
{
	if((-1<i)&&(i<m_itemData.count()))
		m_itemData[i]=s;
	emit modelReset();
}

TreeItem *TreeItem::child(int row)
{
	return m_childItems.value(row);
}

int TreeItem::childCount() const
{
	return (m_childItems.isEmpty())?0:m_childItems.count();
}

int TreeItem::columnCount() const
{
	return m_itemData.count();
}

void TreeItem::append(QList<QVariant> data)
{
	appendChild(new TreeItem(data,this));
	emit modelReset();
}

QVariant TreeItem::data(int column) const
{
	return (column<m_itemData.count())?m_itemData.value(column):QVariant();
}

TreeItem *TreeItem::parentItem()
{
	return m_parentItem;
}

int TreeItem::row() const
{
	if (m_parentItem) {
		return m_parentItem->m_childItems.indexOf(const_cast<TreeItem*>(this));
	}
	return 0;
}

int TreeItem::column() const
{
	int ret=0;
	TreeItem *parent = m_parentItem;
	while (parent!=nullptr) {
		parent = parent->parentItem();
		ret++;
	}
	return ret;
}

void TreeItem::onModelReset()
{
	emit modelReset();
}

