#!/usr/bin/env bash

if [[ ! -z ${AWS_ACCESS_KEY+x} || ! -z ${AWS_SECRET_KEY+x} ]]; then
  airflow connections --delete --conn_id aws_default
  airflow connections --add --conn_id aws_default --conn_type aws --conn_login ${AWS_ACCESS_KEY} --conn_password ${AWS_SECRET_KEY} &> /dev/null
fi

airflow connections --delete --conn_id redshift_default
airflow connections --add --conn_id redshift_default --conn_type postgres --conn_host ${REDSHIFT_HOST} --conn_port ${REDSHIFT_PORT} --conn_login ${REDSHIFT_LOGIN} --conn_password ${REDSHIFT_PASSWORD} --conn_schema ${REDSHIFT_DB} &> /dev/null
