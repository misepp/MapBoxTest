//#include <QGuiApplication>
//#include <QQmlApplicationEngine>
#include <QSurfaceFormat>
#include <QApplication>
#include <QQuickView>
#include <QLoggingCategory>
#include <q3dsruntimeglobal.h>

int main(int argc, char *argv[])
{
    // For printing out infomration on graphics settings and performance
    //qputenv("QSG_INFO", "1");
    //Setting env variables must be done creating the QApplication object
    //qputenv("QT_OPENGL", "angle"); // Env variable for forcing ANGLE
    //qputenv("QSG_RENDER_LOOP", "basic"); // Env variable for forcing a certain render loop (basic, windows, threaded)
    QApplication app(argc, argv);
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // For printing out info graphic settings/performance
    //QLoggingCategory::setFilterRules("qt.scenegraph.general = true");

    //QGuiApplication app(argc, argv);

    QSurfaceFormat::setDefaultFormat(Q3DS::surfaceFormat());

    QQuickView viewer;
    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.setTitle("Map testing");
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.resize(1280, 480);
    viewer.show();

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
