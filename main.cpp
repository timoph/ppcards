#include <QGuiApplication>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    if (view.status() == QQuickView::Error)
        return -1;

#if defined(Q_OS_ANDROID) || defined(Q_OS_IOS)
    view.showFullScreen();
#else
    view.show();
#endif
    return app.exec();
}
