/****************************************************************************
** Meta object code from reading C++ file 'SLAMDunkPanel.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/slamdunk_ros/slamdunk_visualization/src/SLAMDunkPanel.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SLAMDunkPanel.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_slamdunk_visualization__SLAMDunkPanel[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      39,   38,   38,   38, 0x08,
      53,   38,   38,   38, 0x08,
      70,   38,   38,   38, 0x08,
      93,   38,   38,   38, 0x08,
     110,   38,   38,   38, 0x08,
     126,   38,   38,   38, 0x08,
     145,   38,   38,   38, 0x08,
     171,   38,   38,   38, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_slamdunk_visualization__SLAMDunkPanel[] = {
    "slamdunk_visualization::SLAMDunkPanel\0"
    "\0restartSLAM()\0restartCapture()\0"
    "pclXyzrgbConcatClear()\0startStreaming()\0"
    "stopStreaming()\0restartStreaming()\0"
    "startStreamingReception()\0"
    "stopStreamingReception()\0"
};

void slamdunk_visualization::SLAMDunkPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        SLAMDunkPanel *_t = static_cast<SLAMDunkPanel *>(_o);
        switch (_id) {
        case 0: _t->restartSLAM(); break;
        case 1: _t->restartCapture(); break;
        case 2: _t->pclXyzrgbConcatClear(); break;
        case 3: _t->startStreaming(); break;
        case 4: _t->stopStreaming(); break;
        case 5: _t->restartStreaming(); break;
        case 6: _t->startStreamingReception(); break;
        case 7: _t->stopStreamingReception(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData slamdunk_visualization::SLAMDunkPanel::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject slamdunk_visualization::SLAMDunkPanel::staticMetaObject = {
    { &rviz::Panel::staticMetaObject, qt_meta_stringdata_slamdunk_visualization__SLAMDunkPanel,
      qt_meta_data_slamdunk_visualization__SLAMDunkPanel, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &slamdunk_visualization::SLAMDunkPanel::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *slamdunk_visualization::SLAMDunkPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *slamdunk_visualization::SLAMDunkPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_slamdunk_visualization__SLAMDunkPanel))
        return static_cast<void*>(const_cast< SLAMDunkPanel*>(this));
    typedef rviz::Panel QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int slamdunk_visualization::SLAMDunkPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef rviz::Panel QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
