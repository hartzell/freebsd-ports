# $FreeBSD$

PORTNAME=	caddy-custom
DISTVERSIONPREFIX=	v
DISTVERSION=	0.0.4
PORTREVISION=	2
CATEGORIES=	www

MAINTAINER=	hartzell@alerce.com
COMMENT=	My custom caddy + plugins

LICENSE=	APACHE20

# arguably, ca_root_nss should be a go RUN_DEPENDS, ports bug filed #237986
BUILD_DEPENDS=	git>=0:devel/git ca_root_nss>=0:security/ca_root_nss
RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss

USES=		go
GO_PKGNAME=	github.com/${GH_ACCOUNT}/${PORTNAME}
USE_GITHUB=	yes
GH_ACCOUNT=	hartzell

SUB_FILES=	pkg-message
PLIST_FILES=	bin/caddy etc/rc.d/caddy
CONFLICTS_INSTALL=	caddy

OPTIONS_DEFINE=	CGI DOCKER-PROXY FILTER GIT S3BROWSER TELEMETRY WEBDAV
CGI_DESC=	Enable the cgi plugin
CGI_VARS=	caddy_tags+=cgi
DOCKER-PROXY_DESC=	Enable the docker-proxy plugin
DOCKER-PROXY_VARS=	caddy_tags+=docker-proxy
FILTER_DESC=	Enable the filter plugin
FILTER_VARS=	caddy_tags+=filter
GIT_DESC=	Enable the git plugin
GIT_VARS=	caddy_tags+=git
S3BROWSER_DESC=	Enable the s3browser plugin
S3BROWSER_VARS=	caddy_tags+=s3browser
TELEMETRY_DESC=	Enable Caddy telemetry
TELEMETRY_VARS=	caddy_tags+=telemetry
WEBDAV_DESC=	Enable the webdav plugin
WEBDAV_VARS=	caddy_tags+=webdav

APPNAME=caddy

do-build:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GO_ENV} ${GO_CMD} build -tags "${CADDY_TAGS}"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${APPNAME} \
		${STAGEDIR}/${PREFIX}/bin/${APPNAME}
	${INSTALL_SCRIPT} dist/init/freebsd/${APPNAME} \
		${STAGEDIR}/${PREFIX}/etc/rc.d/${APPNAME}

.include <bsd.port.mk>
