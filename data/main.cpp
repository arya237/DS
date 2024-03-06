#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "smnsh.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    Smnsh myapp;
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("back" , &myapp);
    const QUrl url(u"qrc:/data/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
