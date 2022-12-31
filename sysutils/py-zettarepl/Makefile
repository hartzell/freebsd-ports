# $FreeBSD$

PORTNAME=	zettarepl
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	sysutils python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

# My fork of FreeNAS' port for zettarepl
# I think that I started from a newer one, but here's a post hoc pointer
# https://github.com/truenas/ports/tree/freenas/master/sysutils/py-zettarepl
MAINTAINER=	hartzell@alerce.com
COMMENT=	Cross-platform ZFS replication solution

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coloredlogs>0:devel/py-coloredlogs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}croniter>0:sysutils/py-croniter@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}isodate>0:devel/py-isodate@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema>0:devel/py-jsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}paramiko>0:security/py-paramiko@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}dateutil>0:devel/py-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytz>0:devel/py-pytz@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist distutils
USE_GITHUB=	yes
GH_ACCOUNT=	hartzell-forks
GH_TAGNAME=	bfa68c6185db5ea4001beb5800fd15487f12523f
USE_RC_SUBR= zettarepl
SUB_LIST=	PYTHON_CMD=${PYTHON_CMD} \
		ECHO=${ECHO} EGREP=${EGREP} TOUCH=${TOUCH} \
		CHOWN=${CHOWN} RM=${RM:Q}

.include <bsd.port.mk>
