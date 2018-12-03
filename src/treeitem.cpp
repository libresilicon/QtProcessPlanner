/*
    treeitem.cpp

    A container for items of data supplied by the simple tree model.
*/

#include <QStringList>
#include "treeitem.h"

#define TOROLE(x) (x-Qt::UserRole-1)
#define FROMROLE(x) (x+Qt::UserRole+1)

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
}

QString TreeItem::dataMember(int i)
{
	return ((-1<i)&& (i<m_itemData.count()))?m_itemData[i].toString():QString();
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
}

QVariant TreeItem::data(int column) const
{
	return m_itemData.value(FROMROLE(column));
}

TreeItem *TreeItem::parentItem()
{
	return m_parentItem;
}

int TreeItem::row() const
{
	if (m_parentItem)
		return m_parentItem->m_childItems.indexOf(const_cast<TreeItem*>(this));
	return 0;
}
