#include <QCoreApplication>
#include <QTextStream>
#include <QTimer>

int main(int argc, char **argv)
{
    QCoreApplication app (argc, argv);
    QTextStream out(stdout);
    out << "Hello World\n";

    QTimer::singleShot(0, &QCoreApplication::quit);

    return app.exec();
}