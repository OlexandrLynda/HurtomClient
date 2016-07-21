#ifndef PARSEHURTOMXML_H
#define PARSEHURTOMXML_H

#include <xmlhurtomreader.h>

class ParseHurtomXml
{
public:
    ParseHurtomXml(QString adress);
    void set_adress(QString adress);
    QString get_adress();
    void readXml();

private:
    QString m_adress;
};

#endif // PARSEHURTOMXML_H
