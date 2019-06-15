# $FreeBSD$

PORTNAME=	sanoid
DISTVERSION=	v2.0.1
CATEGORIES=	sysutils

MAINTAINER=	hartzell@alerce.com
COMMENT=	Policy-driven snapshot management and replication tools

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${LOCALBASE}/bin/lzop:archivers/lzop \
		${LOCALBASE}/bin/mbuffer:misc/mbuffer \
		${LOCALBASE}/bin/pv:sysutils/pv \
		p5-Capture-Tiny>=0:devel/p5-Capture-Tiny \
		p5-Config-IniFiles>=0:devel/p5-Config-IniFiles

USES=		shebangfix perl5

USE_GITHUB=	yes
GH_ACCOUNT=	jimsalterjrs

USE_PERL5=	run
SHEBANG_FILES=	findoid sanoid sleepymutex syncoid

# line 19:  my %args = ("configdir" => "/etc/sanoid");
post-patch:
	@${REINPLACE_CMD} -i '' -e 's|/etc/sanoid|${PREFIX}/etc/sanoid|' \
		${WRKSRC}/sanoid

do-build:

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/findoid ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/sanoid ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/sleepymutex ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/syncoid ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/sanoid.defaults.conf \
		${STAGEDIR}${PREFIX}/etc/sanoid.defaults.conf
	${INSTALL_DATA} ${WRKSRC}/sanoid.conf \
		${STAGEDIR}${PREFIX}/etc/sanoid.conf.sample

.include <bsd.port.mk>
