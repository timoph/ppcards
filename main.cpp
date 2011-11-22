#include <QtGui/QApplication>
#include <QtDeclarative>
#include "imageprovider.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QDeclarativeView view;
    view.engine()->addImageProvider(QLatin1String("pics"), new ImageProvider);
    view.setSource(QUrl("qrc:///main.qml"));
    view.showFullScreen();
    return app.exec();
}
