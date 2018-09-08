#!/bin/bash -e


if [ ${DNSMASQ_ADDRESS_DOMAIN} ]; then
  echo "ANDAHME: Applying Configuration (DNSMASQ_ADDRESS_DOMAIN): ${DNSMASQ_ADDRESS_DOMAIN}"
  echo "ANDAHME: Applying Configuration (DNSMASQ_ADDRESS_IP): ${DNSMASQ_ADDRESS_IP}"

  echo address=/${DNSMASQ_ADDRESS_DOMAIN}/${DNSMASQ_ADDRESS_IP:-127.0.0.1} >> /etc/dnsmasq.conf
fi


exec $@

