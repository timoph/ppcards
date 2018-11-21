#include <QtGui/QGuiApplication>
#include <QQuickView>
#include "imageprovider.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;
    view.engine()->addImageProvider(QLatin1String("pics"), new ImageProvider);
    view.setSource(QUrl("qrc:///main.qml"));
    //view.showFullScreen();
    view.show();
    return app.exec();
}
