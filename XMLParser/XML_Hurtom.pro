QT += core
QT -= gui

CONFIG += c++11

TARGET = XML_Hurtom
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    channel.cpp \
    release.cpp \
    xmlhurtomreader.cpp \
    parsehurtomxml.cpp

HEADERS += \
    channel.h \
    release.h \
    xmlhurtomreader.h \
    parsehurtomxml.h
