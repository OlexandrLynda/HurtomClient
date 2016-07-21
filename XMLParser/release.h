#ifndef RELEASE_H
#define RELEASE_H

#include <QString>
#include <QStringList>

class Release
{
public:
    Release();
    QString get_title() const {return m_title;}
    QString get_link() const {return m_link;}
    QString get_pubdate() const {return m_pubdate;}
    QString get_guid() const {return m_guid;}
    QString get_description() const {return m_description;}
    QString get_creator() const {return m_creator;}
    QString get_subject() const {return m_subject;}
    QString get_category() const {return m_category;}
    QString get_comments() const {return m_comments;}

    void set_title(const QString& title) {this->m_title = title;}
    void set_link(const QString& link) {this->m_link = link;}
    void set_pubdate(const QString& pubdate){this->m_pubdate = pubdate;}
    void set_guid(const QString& guid){this->m_guid = guid;}
    void set_description(const QString& description){this->m_description = description;}
    void set_creator(const QString& creator){this->m_creator = creator;}
    void set_subject(const QString& subject){this->m_subject = subject;}
    void set_category(const QString& category){this->m_category = category;}
    void set_comments(const QString& comments){this->m_comments = comments;}

    void print() const;

private:
    QString m_title;
    QString m_link;
    QString m_pubdate;
    QString m_guid;
    QString m_description;
    QString m_creator;
    QString m_subject;
    QString m_category;
    QString m_comments;
};

#endif // RELEASE_H

