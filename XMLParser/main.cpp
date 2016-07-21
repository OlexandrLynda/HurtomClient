#include "parsehurtomxml.h"

int main()
{
    QString adress = "D:/Qt_projects/XML_Hurtom/rss.xml";
    ParseHurtomXml* xml = new ParseHurtomXml(adress);
    qDebug() << xml->get_adress();
    xml->readXml();
    //readXml("D:/Qt_projects/XML_Hurtom/rss.xml");
    return 0;
}
