#!/usr/bin/env bash

if [[ ! -z ${AWS_ACCESS_KEY+x} || ! -z ${AWS_SECRET_KEY+x} ]]; then
  airflow connections delete aws_default
  airflow connections add aws_default --conn-type aws --conn-login ${AWS_ACCESS_KEY} --conn-password ${AWS_SECRET_KEY} &> /dev/null
fi

airflow connections delete redshift_default || true
airflow connections add redshift_default --conn-type postgres --conn-host ${REDSHIFT_HOST} --conn-port ${REDSHIFT_PORT} --conn-login ${REDSHIFT_LOGIN} --conn-password ${REDSHIFT_PASSWORD} --conn-schema ${REDSHIFT_DB} &> /dev/null
