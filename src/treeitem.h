#ifndef TREEITEM_H
#define TREEITEM_H

#include <QList>
#include <QVariant>
#include <QAbstractItemModel>
#include <QDebug>

class TreeItem : public QObject
{
	Q_OBJECT

	public:
		explicit TreeItem();
		explicit TreeItem(const QList<QVariant> &data, TreeItem *parentItem = 0);
		~TreeItem();

		void appendChild(TreeItem *child);

		Q_INVOKABLE TreeItem *child(int row);
		Q_INVOKABLE int childCount() const;
		int columnCount() const;
		Q_INVOKABLE QVariant data(int column) const;
		int row() const;
		TreeItem *parentItem();

		Q_INVOKABLE void append(QList<QVariant> data);

		Q_INVOKABLE QString dataMember(int i);

	private:
		QList<TreeItem*> m_childItems;
		QList<QVariant> m_itemData;
		TreeItem *m_parentItem;


};

#endif // TREEITEM_H
