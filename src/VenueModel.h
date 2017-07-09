#pragma once

#include <QtCore/QHash>
#include <QtCore/QSet>
#include <QStandardItemModel>
#include <QtQml/QJSValue>

class QReadWriteLock;
class QQmlEngine;

class VenueModel : public QStandardItemModel
{
    Q_OBJECT

    Q_PROPERTY(bool loaded READ loaded NOTIFY loadedChanged)

public:
    enum VenueModelCategory
    {
        Food,
        Shopping
    };
    Q_ENUM(VenueModelCategory)

    enum VenueModelRoles
    {
        ID = Qt::UserRole + 1,
        Name,

        // Model Category
        ModelCategory,
        Favorite,

        Street,
        Description,
        Website,
        Telephone,
        Pictures,

        // Coordinates
        LatCoord,
        LongCoord,

        // Properties
        Wlan,
        VeganCategory,
        HandicappedAccessible,
        HandicappedAccessibleWc,
        Catering,
        Organic,
        Delivery,
        SeatsOutdoor,
        SeatsIndoor,
        Dog,
        ChildChair,

        // OpeningHours
        OtMon,
        OtTue,
        OtWed,
        OtThu,
        OtFri,
        OtSat,
        OtSun
    };

    VenueModel(QObject *parent = 0);

    Q_INVOKABLE void importFromJson(const QJSValue&, VenueModelCategory);
    Q_INVOKABLE void setFavorite(const QString& id, bool favorite = true);
    QHash<int, QByteArray> roleNames() const override;

    bool loaded() const;

signals:
    void loadedChanged(bool);

private:
    QModelIndex indexFromID(const QString& id) const;
    QStandardItem* jsonItem2QStandardItem(const QJSValue& from);
    bool m_loaded;
};

