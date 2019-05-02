#!/bin/bash -e


export GITEA_APP_INI=/var/lib/gitea/custom/conf/app.ini


if [ -f ${GITEA_APP_INI} ]; then
  echo "Detected existing app.ini"
  exec $@
fi


echo "Generating app.ini"
mkdir -p /var/lib/gitea/custom/conf

echo """
ROOT_PATH = /var/lib/gitea/log
APP_NAME = andahme
RUN_USER = gitea
RUN_MODE = prod

[database]
DB_TYPE  = sqlite3
HOST     = 127.0.0.1:3306
NAME     = gitea
USER     = gitea
PASSWD   =
SSL_MODE = disable
PATH     = data/gitea.db

[repository]
ROOT = /var/lib/gitea/gitea-repositories

[server]
SSH_DOMAIN       = ${GITEA_SSH_DOMAIN}
DOMAIN           = ${GITEA_DOMAIN}
HTTP_PORT        = 3000
ROOT_URL         = http://${GITEA_ROOT_URL}/
DISABLE_SSH      = false
START_SSH_SERVER = true
SSH_PORT         = ${GITEA_SSH_PORT}
SSH_LISTEN_PORT =  2222
LFS_START_SERVER = true
LFS_CONTENT_PATH = /var/lib/gitea/data/lfs
LFS_JWT_SECRET   = TnrnBEhEUUuking05SoyCu16_tghxOP7_d0m_QBNmRs
OFFLINE_MODE     = true

[mailer]
ENABLED = false

[service]
REGISTER_EMAIL_CONFIRM            = false
ENABLE_NOTIFY_MAIL                = false
DISABLE_REGISTRATION              = true
ALLOW_ONLY_EXTERNAL_REGISTRATION  = false
ENABLE_CAPTCHA                    = false
REQUIRE_SIGNIN_VIEW               = true
DEFAULT_KEEP_EMAIL_PRIVATE        = false
DEFAULT_ALLOW_CREATE_ORGANIZATION = true
DEFAULT_ENABLE_TIMETRACKING       = true
NO_REPLY_ADDRESS                  = ${GITEA_NO_REPLY_ADDRESS}

[picture]
DISABLE_GRAVATAR        = true
ENABLE_FEDERATED_AVATAR = false

[openid]
ENABLE_OPENID_SIGNIN = false
ENABLE_OPENID_SIGNUP = false

[session]
PROVIDER = file

[log]
MODE      = file
LEVEL     = Info
ROOT_PATH = /var/lib/gitea/log
""" >> ${GITEA_APP_INI}


exec $@

