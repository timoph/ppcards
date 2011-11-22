#include "imageprovider.h"

#include <QDebug>

ImageProvider::ImageProvider() :
    QDeclarativeImageProvider(QDeclarativeImageProvider::Pixmap)
{
}

QPixmap ImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    Q_UNUSED(size);
    Q_UNUSED(requestedSize);

    QPixmap pixmap;

    if(id == "0") {
        pixmap.load(":/none.png");
    }
    else if(id == "1") {
        pixmap.load(":/half.png");
    }
    else if(id == "2") {
        pixmap.load(":/one.png");
    }
    else if(id == "3") {
        pixmap.load(":/two.png");
    }
    else if(id == "4") {
        pixmap.load(":/three.png");
    }
    else if(id == "5") {
        pixmap.load(":/five.png");
    }
    else if(id == "6") {
        pixmap.load(":/eight.png");
    }
    else if(id == "7") {
        pixmap.load(":/thirteen.png");
    }
    else if(id == "8") {
        pixmap.load(":/twenty.png");
    }
    else if(id == "9") {
        pixmap.load(":/fourty.png");
    }
    else if(id == "10") {
        pixmap.load(":/hundred.png");
    }
    else if(id == "11") {
        pixmap.load(":/what.png");
    }
    else if(id == "12") {
        pixmap.load(":/coffee.png");
    }
    else
        return QPixmap();

    return pixmap;
}
