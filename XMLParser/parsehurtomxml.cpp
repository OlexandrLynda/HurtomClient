#include "parsehurtomxml.h"

ParseHurtomXml::ParseHurtomXml(QString adress)
{
    m_adress = adress;
}

void ParseHurtomXml::set_adress(QString adress)
{
    m_adress = adress;
}

QString ParseHurtomXml::get_adress()
{
    return m_adress;
}

void ParseHurtomXml::readXml()
{
    QFile file(m_adress);
    if(!file.open(QFile::ReadOnly | QFile::Text)){
        qDebug() << "Cannot read file" << file.errorString();
        return;
    }

    Channel* channel = new Channel;
    Xmlhurtomreader xmlReader(channel);

    if (!xmlReader.read(&file))
        qDebug() << "Parse error in file " << xmlReader.errorString();
    else
        channel->print();
}

